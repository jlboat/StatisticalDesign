#source("c:/Work07/StatDesign07/Programs/R/Examples/Hypertension.R",print.eval=TRUE)#
#Does scod for Hypertension repeated measure
data<-read.table("../data/Hypertension.txt",sep = "",header=T)
Subject<-as.character(data[,1])
Trt<-as.character(data[,2])
Time<-as.character(data[,3])
Y<-data[,4]
aovdata <- data.frame(Y,Time,Trt,Subject)
#----------This is the standard anova--------
summary(aov(Y ~Trt+Error(Subject/Trt)+Trt*Time,data=aovdata))
#----------Table the cell means-----------------------------
tab<-list(Trt,Time)
tapply(Y,tab,mean)

