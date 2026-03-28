# Kategorik Veri H4 P:15/83
library(dslabs)
data(murders)
head(heights)

# Frequency Table H4 P:16/83
prop.table(table(heights$sex))

# Normal Dagilim H4 P:28/83
average<-sum(x)/length(x)
sd<-sqrt(sum(x-average)^2)/length(x))
library(dslabs)
data("heights")
index<-heights$sex=="Male"
x<-heights$height[index]
average<-mean(x)
sd<-sd(x)
c(average=average,sd=sd)

# Standart Birim H4 P:29/83
z<-scale(x)

# Standart Sapmaya Uzaklik H4 P:30/83
library(dslabs)
data("heights")
index<-heights$sex=="Male"
x<-heights$height[index]
z<-scale(x)
sum(abs(z)<2)
mean(abs(z)<2)

# Normal Dagilim icin Kumulatif Dagilim Fonksiyonu H4 P:31/83
pnorm()
pnorm(a,avg,s)
pnorm(70.5,mean(x),sd(x))

# Surekli Degisken H4 P:33/83
mean(x<=68.5)-mean(x<=67.5)
pnorm(68.5,mean(x),sd(x))-pnorm(67.5,mean(x),sd(x))
mean(x<=75.5)-mean(x<=68.5)
pnorm(75.5,mean(x),sd(x))-pnorm(68.5,mean(x),sd(x))
mean(x<=80.5)-mean(x<=75.5)
pnorm(80.5,mean(x),sd(x))-pnorm(75.5,mean(x),sd(x))

# Ayriklastirma (Discretization) H4 P:34/83
mean(x<=70.9)-mean(x<=70.1)
pnorm(70.9,mean(x),sd(x))-pnorm(70.1,mean(x),sd(x))

#Qauntiles (Nicelik Dilimleri) H4 P:36/83
mean(x<=69.5)

#Yuzdelik ve Nicelik Dilimleri H4 P:37/83
observed_quantiles<-quantile(x,p)
theoretical_quantiles<-qnorm(p,mean=mean(x),sd=sd(x))
p<-seq(0.05,0.95,0.05)
observed_quantiles<-quantile(x,p)
theoretical_quantiles<-qnorm(p,mean=mean(x),
                             sd=sd(x))
plot(theoretical_quantiles,observed_quantiles)
abline(0,1)

# Standart Birimler Kullanirsak H4 P:38/83
p<-seq(0.05,0.95,0.05)
z<-scale(x)
observed_quantiles<-quantile(z,p)
theoretical_quantiles<-qnorm(p)
plot(theoretical_quantiles,observed_quantiles)
abline(0,1)

# ggplot2 temelleri H4 P:54/83
install.packages("ggplot2")
library(ggplot2)
library(tidyverse)
install.packages("tidyverse")

# Gun Murders in US H+ P:57/83
library(tidyverse)
library(dslabs)
data(murders)

# Veri Bilesenleri ile yeni grafik olusturma H4 P:59/83
## first option
murders |> ggplot()
## second option
murders %>% ggplot()
## third option
ggplot(data=murders)
ggplot(murders)

# Grafige degisken atama H4 P:60/83
p<-murders |> ggplot()
class(p)
print(p)

# Layers - Scatter Plot H4 P:62/83
geom_point()
geom_xxxx()

# Layers: Geometry ve Aesthetic Mapping / Data Mapping H4 P:63/83
?geom_point()
p<-murders |> ggplot()
murders |> ggplot() + geom_point(aes(x=population/10^6,y=total))

# -veya- H4 P:64/83
p<-murders |> ggplot()
p+geom_point(aes(x=population/10^6,y=total))

# Layers: Scales(Olcekler) ve Labels(Etiketler) H4 P:65/83
p+geom_point(aes(x=population/10^6,y=total))+
  geom_text(aes(population/10^6,total, label=abb))

# Tinkering H4 P:67/83
p+geom_point(aes(x=population/10^6,y=total),size=3)+
  geom_text(aes(population/10^6,total,label=abb))

# Label tinkering or Nudge fonksiyonu H4 P:68/83
p+geom_point(aes(x=population/10^6,y=total),size=3)+geom_text(aes(population/10^6,total,label=abb,nudge_x=1))

#  Kuresel Estetik Eslestirme H4 P:69/83
args(ggplot)

# Geometri Tanimlama H4 P:70/83
p<-murders |> ggplot(aes(population/10^6,total,label=abb))
p+geom_point(size=3)+geom_text(nudge_x=1.5)

# Kuresel Eslesme ve Mapping Katman Tanimlama H4 P:71/83
p<-murders |> ggplot(aes(population/10^6,total,labell=abb))
p+geom_point(size=3)+geom_text(x=10,y=800,label="Hello there!")

# Layers: Scales(Olcekler), labels(etiketler) ve colors(renkler) H4 P:72/83
p<-murders |> ggplot(aes(population/10^6,total,label=abb))
p+geom_point(size=3)+
  geom_text(nudge_x=0.05)+
  scale_x_continuous(trans="log10")+
  scale_y_continuous(trans="log10")

# Log'a ozel fonksiyonlar H4 P:73/83
p+geom_point(size=3)+
  geom_text(nudge_x=0.075)+
  scale_x_log10()+
  scale_y_log10()

# x ve y etiket verme H4 P:74/83
p+geom_point(size=3)+
  geom_text(nudge_x=0.075)+
  scale_x_log10()+
  scale_y_log10()+
  xlab("Populations in millions(log scale)")+
  ylab("Total number of murders(log scale)")+
  ggtitle("US Gun urders in US 2010")

# Renkleri degistirelim H4 P:75/83
p<-murders |> ggplot(aes(population/10^6,total,label=abb))+
  geom_text(nudge_x=0.075)+
  scale_x_log10()+
  scale_y_log10()+
  xlab("Population in millions(log scale)")+
  ylab("Total number of murders(log scale")+
  ggtitle("US Gun Murders in Us 2010")
p+geom_point(size=3,color="blue")  

# Renk argumanina kategorik degisken atama H4 P:76/83
p+geom_point(aes(col=region),size=3)

# Legends & Line H4 P:77/83
r<-murders|>summarize(rate=sum(total)/sum(population)*10^6)
r<-r$rate
## to add a line we geom_abline
## intercept a and slope b
## default has slope 1, intercept 0
p + geom_point(aes(col=region),size=3)+geom_abline(intercept=log10(r))

# Line seklini degistirme H4 P:78/83
p + geom_abline(intercept=log10(r),lty=2,color="darkgrey")+ geom_point(aes(col=region),size=3)

# Ggplot2 grafikleri icin ek paketler H4 P:79/83
install.packages("ggthemes")
install.packages("ggrepe1")
install.packages("theme_economist")

# Tema stiline katman ekleme H4 P:80/83
library(ggthemes)
p + theme_economist()
p + theme_fivethirtyeight()

# Grafikteki metin etiketlerin yerini ust uste gelmeyecek sekilde degistirme H4 P:82/83
library(ggthemes)
library(ggrepe1)
## first define the slope of the line
r <- murders |> summarize (rate=sum(total)/sum(population)*10^6)%>%.$rate
## now make the plot
murders |> ggplot(aes(population/10^6,total,label=abb))+
  geom_abline(intercept=log10(r),lty=2,color="darkgrey")+
  geom_point(aes(col=region),size=3)+
  geom_text_repel()+
  scale_x_log10()+
  scale_y_log10()+
  xlab("Populations in millions (log scale)")+
  ylab("Total number of murders (log scale)")+
  ggtitle("US Gun Murders in US 2010")+
  scale_color_discrete(name="Region")+
  theme_economist()
