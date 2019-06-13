#source("c:/Work07/StatDesign07/Programs/R/Examples/AlfalfaTrial-1.R",print.eval=TRUE)#
#Does anova for alfalfa data - replicated, nested blocks
data<-read.table("../data/AlfalfaTrial-1.txt",sep = "",header=T)
Location<-as.character(data[,1])
Block<-as.character(data[,2])
Variety<-as.character(data[,3])
Yield<-data[,4]
aovdata <- data.frame(Yield,Location,Variety,Block)
#----------This gives the anova table- wrong test on Variety-------------------
summary(aov(Yield ~Location*Variety+Error(Block),data=aovdata))
#----------Table the cell means-----------------------------
tab<-list(Location,Variety)
tapply(Yield,tab,mean)

