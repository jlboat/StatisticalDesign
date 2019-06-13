#source("c:/Work07/StatDesign07/Programs/R/Examples/VarietySP.R",print.eval=TRUE)#
#Does split plot anova for variety field trial
data<-read.table("../data/VarietySP.txt",sep = "",header=T)
Rep<-as.character(data[,1])
P<-as.character(data[,2])
K<-as.character(data[,3])
Trt<-as.character(data[,4])
Variety<-as.character(data[,5])
Y<-data[,6]
aovdata <- data.frame(Y,Rep,P,K,Variety,Trt)
#----------This gives the correct test on whole plots
#summary(aov(Y ~Trt+Error(Rep/Trt),data=aovdata))
#----------Correct WP test of factorial treatments
#summary(aov(Y ~P*K+Error(Rep/Trt),data=aovdata))
#----------Full Split Plot analysis - all tests correct------
#summary(aov(Y ~Trt+Error(Rep/Trt)+Variety*Trt,data=aovdata))
#-----------Full SP analysis with Factorial Treatments
summary(aov(Y ~P*K+Error(Rep/Trt)+Variety*P*K,data=aovdata))
#----------Correct SP with nlem------------------------------
#library(nlme)
#anova(lme(Y ~Trt+Variety*Trt,random=~1|Rep/Trt,data=aovdata))
#----------Table the cell means-----------------------------
tab<-list(Variety,Trt)
#table(tab)
tapply(Y,tab,mean)

