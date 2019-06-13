#source("c:/Work07/StatDesign07/Programs/R/Examples/HypertensionRegression.R",print.eval=TRUE)#
#Does scod for Hypertension repeated measure
data<-read.table("../data/Hypertension.txt",sep = "",header=T)
Subject<-data[,1]
Trt<-as.character(data[,2])
Time<-data[,3]
Y<-data[,4]
aovdata <- data.frame(Y,Time,Trt,Subject)
#----------This is the standard anova--------
summary(aov(Y ~Trt+Error(Subject/Trt)+Trt*Time,data=aovdata))
#----------Table the cell means-----------------------------
tab<-list(Trt,Time)
tapply(Y,tab,mean)
n<-length((unique(Subject)))
beta<-rep(0,times=n)
for(i in 1:n){beta[i]<-lm(Y[Subject==i]~Time[Subject==i])$coefficients[2]}
Trt2<-c(rep("HighCa", times=5),rep("LowCa",times=5))
aovdata2 <- data.frame(beta,Trt2)
summary(aov(beta~Trt2,data=aovdata2))
