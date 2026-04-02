library(rvest) 
library(dplyr) 
# Scrap Wikipedia Page: Murder in the United States by state

url <- "https://en.wikipedia.org/w/index.php?title=Gun_violence_in_the_United_States_by_state&direction=prev&oldid=810166167"  

data_html <- read_html(url)  

class(data_html)

tab <- data_html |> html_nodes("table")

tab <- tab[[1]] |> html_table()

tab <- tab |> setNames(c("state", "population", "total", "murder_rate")) 

head(tab)



#  another example
url_wiki <- "https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)"
wiki_page <- read_html(url_wiki)

# Extract all wikitables into data frames
wiki_tables <- wiki_page |> html_table(fill = TRUE)
cat("Tables found:", length(wiki_tables), "\n")

# Find the largest table (likely the population table)
table_sizes <- sapply(wiki_tables, nrow)
pop_table <- wiki_tables[[which.max(table_sizes)]]
head(pop_table, 10)




# JSON
#Here is an example providing information Nobel prize winners:

# OLD API
library(jsonlite) 
library(dplyr) 

nobel <- fromJSON("http://api.nobelprize.org/v1/prize.json")  
nobel$prizes |> select(category) |> distinct()
nobel$prizes |> select(year)
nobel$prizes |> filter(category == "literature" & year == "2006") |> pull(laureates) |> first() |> select(id, firstname, surname)  
nobel$prizes |> filter(category == "chemistry" & year == "2015") |> pull(laureates) |> first() |> select(id, firstname, surname)  
nobel$prizes |> filter(category == "economics" & year == "2024") |> pull(laureates) |> first() |> select(id, firstname, surname)  


# NEW API
library(jsonlite)
library(dplyr)

# New API v2.1 base URL (replaces v1/prize.json)
# The v2.1 API paginates by default and only returns 25 records per request. 
# Setting limit=1000 is a simple way to say "give me everything in one go"
nobel <- fromJSON("https://api.nobelprize.org/2.1/nobelPrizes?limit=1000")

# Browse categories
nobel$nobelPrizes$category$en

# To get distinct categories:
nobel$nobelPrizes |> 
  distinct(category_en = category$en)

# Browse award years
nobel$nobelPrizes |> 
  select(awardYear)

# The literature 1971 filter becomes:
nobel$nobelPrizes |> 
  filter(category$en == "Literature" & awardYear == "2006") |> 
  pull(laureates) |> 
  first() |> 
  select(id, knownName, fullName)

# The chemistry 2015 filter becomes:
nobel$nobelPrizes |> 
  filter(category$en == "Chemistry" & awardYear == "2015") |> 
  pull(laureates) |> 
  first() |> 
  select(id, knownName, fullName)

# The economy 2024 filter becomes:
nobel$nobelPrizes |> 
  filter(category$en == "Economic Sciences" & awardYear == "2024") |> 
  pull(laureates) |> 
  first() |> 
  select(id, knownName, fullName)


# Turkish Nobel laureates from the prizes data
# After unnesting, what columns do we have?
nobel$nobelPrizes |> 
  select(laureates) |> 
  tidyr::unnest(laureates) |> 
  names()


turkish_names <- c("Aziz Sancar", "Orhan Pamuk", "Daron Acemoglu")

turkish_nobel <- nobel$nobelPrizes |> 
  select(laureates) |> 
  tidyr::unnest(laureates) |> 
  filter(knownName$en %in% turkish_names)

turkish_nobel




# lets do a claude code implementation
# Set stage: scrap new data
# Set tasks: scrap economics nobel holders
# Set tasks: scrap number of nobel holders in each category
# Rules: API v2, dataframe, ordered by year




# case study 2
# ==============================================================================
# CASE STUDY: Sahibinden — Car Listings
# ==============================================================================
# Sahibinden.com is Turkey's largest classifieds platform.
# It blocks automated requests (HTTP 403), so we demonstrate two approaches:
#   Part A: Try live scraping (see the block happen)
#   Part B: Parse a saved HTML file (the workaround)
#   Part C: Use AI (Claude Cowork) to scrape directly

# ---- Part A: Live scraping attempt ----
url_sahib <- "https://www.sahibinden.com/en/cars"

sahib_page <- tryCatch({
  resp <- GET(
    url_sahib,
    add_headers(
      `User-Agent` = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
      `Accept-Language` = "en-US,en;q=0.9,tr;q=0.8"
    )
  )
  cat("HTTP Status:", status_code(resp), "\n")
  if (status_code(resp) %in% c(200, 202)) read_html(resp) else NULL
}, error = function(e) {
  message("Connection failed: ", e$message)
  NULL
})

if (is.null(sahib_page)) {
  cat("Sahibinden blocked the request (HTTP 403).\n")
  cat("This is common — many sites block automated requests.\n")
  cat("Solution: save the page from your browser and read the local file.\n")
}


# ---- Part B: Parse saved HTML file ----
# How to save:
#   1. Open https://www.sahibinden.com/en/cars in Chrome
#   2. Right-click -> Save As -> "Webpage, Complete"
#   3. Place the .html file in your working directory

sahib_page <- read_html("sahibinden.html")  # adjust path to your saved file

# Sahibinden uses a gallery layout. Each listing is inside:
#   <td class="searchResultsGalleryContent">
cells <- sahib_page |> html_elements("td.searchResultsGalleryContent")
cat("Listings found:", length(cells), "\n")

# Extract core fields from each cell
sahib_df <- tibble(
  id = cells |>
    html_element(".searchResultsClassifiedId") |>
    html_text2() |> str_remove("#") |> str_trim(),
  
  title = cells |>
    html_element("a.classifiedTitle") |>
    html_text2() |> str_trim(),
  
  url = cells |>
    html_element("a.classifiedTitle") |>
    html_attr("href"),
  
  price = cells |>
    html_element(".searchResultsPriceValue span") |>
    html_text2() |> str_trim()
)

# Each listing has sub-attributes (year, km, color, date, location)
# stored in child <div>s of .searchResultsGallerySubContent
# Each div contains: <span class="...">Label:</span>Value
extract_attribute <- function(cell, label) {
  divs <- cell |> html_elements(".searchResultsGallerySubContent > div") |> html_text2()
  match <- divs[str_detect(divs, fixed(label))]
  if (length(match) == 0) return(NA_character_)
  str_remove(match[1], paste0("^.*", label, ":?\\s*")) |> str_trim()
}

sahib_df$year     <- map_chr(cells, ~ extract_attribute(.x, "Yıl"))
sahib_df$km       <- map_chr(cells, ~ extract_attribute(.x, "KM"))
sahib_df$color    <- map_chr(cells, ~ extract_attribute(.x, "Renk"))
sahib_df$date     <- map_chr(cells, ~ extract_attribute(.x, "İlan Tarihi"))
sahib_df$location <- map_chr(cells, ~ extract_attribute(.x, "İl / İlçe"))

cat("Data extracted:", nrow(sahib_df), "listings\n")
head(sahib_df, 10)
View(sahib_df)

# ---- Clean numeric columns ----
sahib_df <- sahib_df |>
  mutate(
    price_tl = parse_number(price, locale = locale(grouping_mark = ".")),
    year_num = as.integer(year),
    km_num   = parse_number(km, locale = locale(grouping_mark = "."))
  )

summary(sahib_df |> select(price_tl, year_num, km_num))

# ---- Visualizations ----
# Scatter: price vs mileage
sahib_df |>
  ggplot(aes(km_num, price_tl / 1000)) +
  geom_point(aes(color = as.factor(year_num)), size = 3) +
  labs(x = "Kilometers", y = "Price (thousand TL)",
       color = "Year", title = "Sahibinden: Car Price vs Mileage") +
  theme_minimal()

# Boxplot: price by year
sahib_df |>
  ggplot(aes(as.factor(year_num), price_tl / 1000)) +
  geom_boxplot(fill = "steelblue", alpha = 0.7) +
  labs(x = "Model Year", y = "Price (thousand TL)",
       title = "Sahibinden: Price Distribution by Year") +
  theme_minimal()

# Bar: listings by city
sahib_df |>
  mutate(city = str_extract(location, "^[^/]+") |> str_trim()) |>
  count(city, sort = TRUE) |>
  head(10) |>
  mutate(city = fct_reorder(city, n)) |>
  ggplot(aes(n, city)) +
  geom_col(fill = "steelblue") +
  labs(x = "Number of Listings", y = NULL,
       title = "Sahibinden: Listings by City") +
  theme_minimal()




# Stringr

library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Gun_violence_in_the_United_States_by_state&direction=prev&oldid=810166167" 
data_html <- read_html(url) 
class(data_html)
tab <- data_html |> html_nodes("table") 
tab <- tab[[1]]
tab <- tab |> html_table() 
murders_raw <- tab |> setNames(c("state", "population", "total", "murder_rate")) 
class(murders_raw$population)
class(murders_raw$total)

murders_raw$population[1:3]
as.numeric(murders_raw$population[1:3])



murders_raw$population |> str_detect(",")
murders_raw$population |> str_replace_all(",", "") |> as.numeric()

#as this operation is so common, there is a function in readr package:
parse_number(murders_raw$population)


# regex
library(dslabs)
head(reported_heights)
class(reported_heights$height)

# if we try to parse it into numbers, we get a warning:
x <- as.numeric(reported_heights$height)
# we also do end up with many NAs:
sum(is.na(x))

# Here are some of the entries that are not successfully converted:
reported_heights |> mutate(new_height = as.numeric(height)) |>filter(is.na(new_height)) |> head(n = 10)

