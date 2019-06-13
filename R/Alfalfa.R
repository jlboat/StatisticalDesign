#Does anova for Alfalfa Data
data<-read.table("../data/Alfalfa.txt",sep = "",header=T)
Variety<-data[,1]
Block<-as.character(data[,2])
Rep<-as.character(data[,3])
Yield<-data[,4]
aovdata <- data.frame(Yield,Variety,Block,Rep)
#--------RCB ANOVA ---------------------
#----------This gives the full anova table, wrong tests----------------
summary(aov(Yield~Variety+Block+Block:Variety,data=aovdata))
#---------This gives the correct test on Variety-----------------------
summary(aov(Yield~Variety+Block+Error(Block/Block:Variety),data=aovdata))
