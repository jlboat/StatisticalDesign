#Does anova for Diet data
#Note how Subject Data are entered!
data<-read.table("../data/Diet.txt",sep = "",header=T)
Diet<-as.character(data[,1])
Subject<-as.character(data[,2])
Time<-as.character(data[,3])
BP<-data[,4]

#--------------Oneway on averages-------------------------------------------
Diet<-as.character(c(1,1,1,2,2,2,3,3,3,4,4,4))
BPavg<-c(129,128,125.5,128,130.5,132,118.5,120.5,123.5,145,144,146)
aovdata <- data.frame(Diet,BPavg)
summary(aov(BPavg~Diet,data=aovdata))

#--------------Below the Line----------------------------------------------
Diet<-as.character(c(1,1,1,2,2,2,3,3,3,4,4,4))
BPdiff<-c(-12,-16,-7,-22,-11,-20,-9,-23,-17,-10,-6,-16)
aovdata <- data.frame(Diet,BPdiff)
summary(aov(BPdiff~Diet,data=aovdata))
