#source("c:/Work07/StatDesign07/Programs/R/Examples/Peanut.R",print.eval=TRUE)#
#Does Latin square anova for peanut data
data<-read.table("../data/Peanut.txt",sep = "",header=T)
Row<-as.character(data[,1])
Column<-as.character(data[,2])
Treatment<-as.character(data[,3])
Yield<-data[,4]
aovdata <- data.frame(Yield, Row,Column,Treatment)
summary(aov(Yield ~Row+Column+Treatment,data=aovdata))
round(tapply(Yield,Treatment,mean),3)
round(tapply(Yield,Treatment,sd),3)



