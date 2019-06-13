#source("c:/Work07/StatDesign07/Programs/R/Examples/Diet2.R",print.eval=TRUE)#
#Does anova for Diet data
#Split Plot with CRD on Whole Plots
#Note how Subject Data are entered!
data<-read.table("../data/Diet.txt",sep = "",header=T)
Diet<-as.character(data[,1])
Subject<-as.character(data[,2])
Time<-as.character(data[,3])
BP<-data[,4]

#----------Full Split Plot analysis - tests correct------
aovdata <- data.frame(Diet,Subject,Time,BP)
summary(aov(BP ~Diet+Error(Diet/Subject)+Time*Diet,data=aovdata))

#----------Table the cell means-----------------------------
tab<-list(Diet,Time)
tapply(BP,tab,mean)
