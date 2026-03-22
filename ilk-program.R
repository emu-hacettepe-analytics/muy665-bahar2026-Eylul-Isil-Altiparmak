# R Console H1 P:40/100
print ("Merhaba Dunya!")

# Atama Operat??r?? H2 P:33/110
x <- 1
x <- x+1

# SOR: H2 P:34/110'da harf_listesi = [a,b,c,d,e,f] ve harf_listesi[3:5] neden ??al????mad???

# ??s Operat??r?? H2 P:35/100
3^2

# ??lk Program??m??z?? Yazal??m H2 P:44/110
simdiki_yil <- 2025
kurulus_yili <- 2004
yas <- simdiki_yil - kurulus_yili
print(yas)

# De??erler ve Veri Tipleri - Numeric H2 P:61/110
sayi <- 4
class (sayi)
typeof(sayi)

# De??erler ve Veri Tipleri - Character H2 P:63/110
class("Merhaba Dunya!)")
class("4")

# De??erler ve Veri Tipleri - Logical H2 P:64/110
mantik <- FALSE
class(mantik)
typeof(mantik)

# De??erler ve Veri Tipleri - Logical H2 P:65/110
gitar_tel_sayisi <- 6
mandolin_tel_sayisi <- 8
## Enst??rmanlar?? tel say??s?? kar????la??t??rmas??
gitar_tel_sayisi > mandolin_tel_sayisi 
gitar_tel_sayisi < mandolin_tel_sayisi
## Sayisal degerlerin karsilastirilmasi
6==8
## Iki metnin karsilastirmasi
"mandolin" > "gitar"

# Fonksiyonlar H2 P:68/110
help ("sqrt")
?sqrt
args(sqrt)
sqrt()
sqrt(x)

# Fonksiyonlar H2 P:69/110
log()
help("log")
?log
args(log)
log(20)
log(20,base=2)

# Fonksiyonlar H2 P:70/110
log(x=20,base=2)
log(20,base=2)
log(20,2)
log(x=20,2)
log(base=2,x=20)

# Built-in (Base)/R'??n i??inde var olan Fonksiyonlar H2 P:72/110
print("Merhaba Dunya")
sqrt(25)
min(1,0.75,1.25)
nchar("Merhaba Dunya")
sum(1,5)
round(3.1415,3)
toupper("hi mom")
paste("hi","mom")
nchar("hi mom")
c(1,2)
seq(1,5)

#Veri T??r?? ??evirme Fonksiyonlar?? H2 P:73/110
kullanici_no <- 1234
as.character(kullanici_no)
kullanici_no_character <- "1234"
as.numeric(kullanici_no_character)

# R Paketleri H2 P:75/110
install.packages("stringr")
library("stringr")
str_count("Mississippi","i")

# Aritmetik Operat??rler H2 P:77/110
help("+")

# Baz?? Aritmetik Operat??rler H2 P:78/110
(9/3)+(4*2)-(3^2)+sqrt(4)
9/3 + 4*2 - (3^2) + sqrt(4)
exp(2) + log(20) + log(20,base=2) + 14%%3

# ??li??kisel Operat??rler H2 P:79/110
help("<")

# Vekt??rler H2 P:82/110
ogrenci_adi <- c("Ali","Ayse","Burak","Cemre")
final_notlari <- c(85,90,78,88)

# Fakt??rler H2 P:83/110
performans <- factor(c("Iyi","Orta","Iyi","Kotu"))

# Data Frame (Veri ??er??evesi) H2 P:84/110
ogrenci_verileri <- data.frame(
  Ad=c("Ali","Ayse","Burak","Cemre"),
  Vize=c(75.5,80.0,92.3,65.0),
  Final=c(85,90,78,88),
  Basarili=c(TRUE,TRUE,FALSE,TRUE)
)

# Vaka ??al????mas?? H2 P:86/110
## install.packages("dslabs")
install.packages("dslabs")
library(dslabs)
data(murders)
class(murders)

# Nesne Yap??s?? H2 P:87/110
str(murders)
head()
head(murders)

# Nesnenin De??i??kenlerine Eri??im H2 P:88/110
murders$population
str()
names()
names(murders)

# Movielens H2 P:89/110
library(dslabs)
data(movielens)
title

# Say??sal Vekt??r H2 P:90/110
murders$population
pop <- murders$population
length(pop)
class(pop)

# Character Vectors H2 P:92/110
murders$state
class(murders$state)

# Nas??l vekt??r yarat??r??z? H2 P:93/110
c()
codes <- c(380,124,818)
country <- c("italy","canada","egypt")
print(codes)
print(country)

# Bir ba??ka vekt??r yaratma yolu H2 P:94/110
seq()
seq(1,10)
seq(1,10,2)
1:10

#Alt K??meleme H2 P:95/110
codes[2]
codes[c(1,3)]
codes[1:2]

# Coercion H2 P:97/110
x <- c(1,"Canada",3)
x
class(x)

# R'??n kendi d??n??????m fonksiyonlar?? H2 P:98/110
x <- 1:5
y <- as.character(x)
y
as.numeric(y)

# NA H2 P:99/110
x <- c(1,"b",3)
as.numeric(x)

# S??ralama (Sorting) H2 P:100/110
sort()
sort(murders$total)

# Azdan ??o??a S??ralama H2 P:101/110
order()
x <- c(31,4,15,92,65)
x
sort(x)
index <- order(x)
index
x[index]

# Murders S??ralama H2 P:102/110
index <- order(murders$total)
index
murders$abb[index]

# En y??ksek oran?? bulma H2 P:103/110
max () and min()
max(murders$total)
which.max(murders$total)
murders$state[which.max(murders$total)]
min(murders$total)
which.min(murders$total)
murders$state[which.min(murders$total)]

# Rank H2 P:104/110
rank()
x <- c(31,4,15,92,65)
rank(x)

# Vekt??r Aritme??i H2 P:106/110
heights <- c(69,62,66,70,73,67,73,67,70)
## inches'?? santimetreye ??evirelim
heights*2.54
heights-69

# En y??kse??in Oran?? H2 P:107/110
murders$state[which.max(murders$population)]

# Veri-Orana Denk De??ilse H2 P:108/110
max(murders$population)

# Rate H2 P:109/110
murder_rate <- (murders$total/murders$population)
murders$state[order(murder_rate,decreasing=TRUE)]

# Fakt??rler " Categorical Data" H2 P:110/110
levels(murders$region)

# Ko??ullu Y??r??tme (Conditional Execution) H3 P: 34/83
if(boolean condition) {
  expressions
} else {
  alternative expressions
}

# Mant??ksal (Boolean) ??fadeler H3 P:36/83
430==430
430==679

#Ko??ullu ??fadeler H3 P:37/83
x <-660
if(x>0){
  print("x is positive")
}
if(x>0){print("x is positive")}
if(x>0)
  print("x is positive")

# Kar????la??t??rma Operat??rleri H3 P:38/83
x==y
x!=y
x>y
x<y
x>=y
x<=y

# Mant??ksal Operat??rler H3 P:39/83
&(and), I(or)
x<-500
x>430&x<679
x<-300
x>430&x<679

# Alternatifli Ko??ullar H3 P: 40/83
x<-430
if(x%%2==0){
  print("x is even")
} else {
  print("x is odd")
}

# Zincirli Ko??ullar H3 P:41/83
if(x<y){
  print("x is less than y")
} else if (x>y){
  print("x is greater than y")
} else {
  print("x and y are equal")
}

#???? i??e Ko??ullar H3 P: 42/83
if(x==y){
  print("x and y are equal")
} else {
  if(x<y){
    print("x is less than y")
  }else{
    print("x is greater than y")
  }
}

#???? i??e Ko??ullar Digit Number H3 P:43/83
if(0<x){
  if(x<10){
    print("x is a positive single-digit number")
  }
}

if(0<x&x<10){
  print("x is a positive single-digit number")
}

# Murders Veri Seti ile Uygulama ??al????mas?? H3 P:44/83
library(dslabs)
data(murders)
murder_rate<-(murders$total/murders$population)*100000
ind<-which.min(murder_rate)
if(murder_rate[ind]<0.5){
  print(murders$state[ind])
}else{
  print("No state has murder rate that low")
}

# E??ik Seviyesi De??i??tirilirse H3 P:45/83
ind<-which.min(murder_rate)
if(murder_rate[ind]<0.25){
  print(murders$state[ind])
}else{
  print("No state has murder rate that low")
}

#ifelse ??fadesi H3 P: 46/83
a<-0
ifelse(a>0,1/a,NA)
a<-5
ifelse(a>0,1/a,NA)

# ifelse vekt??rlerle ??al????ma ve yayg??n kullan??m?? H3 P:47/83
a <- c(0,1,2,-4,5)
ifelse(a>0,1/a,NA)
data(na_example)
sum(is.na(na_example))
no_nas<-ifelse(is.na(na_example),0,na_example)
sum(is.na(no_nas))

# any ve all ifadeleri (fonksiyonlar??) H3 P:48/83
z<-c(TRUE,TRUE,TRUE)
any(z)
all(z)
z<-c(TRUE,TRUE,FALSE)
any(z)
all(z)

# Ayn?? i??lemi ger??ekle??tiren fonsiyonlar - Ortalama Hesaplama H3 P:50/83
sum(x)/length(x)
mean()
avg<-function(x){
  s<-sum(x)
  n<-length(x)
  s/n
}
x<-1:100
avg(x)
identical(mean(x),avg(x))

# Fonksiyonlar Genel Form H3 P:51/83
my_function<-function(x,y,z){
  x,y ve z ile yap??lacak operasyonlar
}
avg<-function(x,arithmetic=TRUE){
  n<-length(x)
  ifelse(arithmetic,sum(x)/n,prod(x)^(1/N))
}

# Tan??mlanan de??i??kenler ??al????ma alan?? i??inde saklanmaz. H3 P:52/83
avg<-function(x){
  s<-sum(x)
  n<-length(x)
  s/n
}
s<-3
avg(1:10)
s

# D??rtgen Alan?? Hesaplama Fonksiyonu H3 P:53/83
## Versiyon 1 
calculate_rect_area<-function(width,height){
  return(width*height)
}
## Versiyon 2 
calculate_rect_area<-function(width,height){
  width*height
}

# Fonksiyonlarda Hata Ay??klama (Debugging) H3 P:54/83
## Versiyon 3
calculate_rect_area<-function(width,height){
  area<-width*height
}

# ??terasyon - For D??ng??leri H3 P: 56/83
for(i in de??er ald?????? aral??????){
  i'nin de??er aral?????? boyuca i'yi kullanan operasyonlar
}
for(i in 1:10){
  print(i)
}

# Arda????k Say??lar??n Toplam?? H3 P:58/83
compute_s_n<-function(n){
  x<-1:n
  sum(x)
}
compute_s_n(3)
compute_s_n(100)

# Grafikli For D??ng??s?? - Arda????k Say??lar??n Toplam?? H3 P:59/83
m<-25
s_n<-vector(length=m)
for(i in 1:m){
  s_n[i]<-compute_s_n(i)
}
n<-1:m
plot(n,s_n)
lines(n,n*(n+1)/2)

# while d??ng??leri H3 P:60/83
n<-430
while (n>0){
  print(n)
  n<-n-50
}

# Daha Etkin D??ng?? Fonksiyon Aileleri H3 P:62/83
sapply(1:4,sqrt)
sapply(1:4,function(i)sqrt(i))

# Sapply fonksiyonu - create an empty vector H3 P:63/83
m<-25
s_n<-vector(length=m)
for(i in 1:m){
  s_n[i]<-compute_s_n(i)
}
sapply(1:m,compute_s_n)

# Her sat??r??n toplam??n?? bulmak i??in H3 P:64/83
df<-data.frame(x=1:4,y=5:8,z=10:13)
apply(x=df,MARGIN=1,FUN=sum)
apply(df,1,sum)
apply(df,2,sum)
