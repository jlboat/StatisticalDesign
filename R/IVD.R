#source("c:/Work07/StatDesign07/Programs/R/Examples/IVD.R",print.eval=TRUE)#
#Does t-test and anova for IVD data
data<-read.table("../data/IVD.txt",sep = "",header=T)
Temp<-as.character(data[,1])
IVD<-data[,2]
aovdata <- data.frame(IVD, Temp)
#----------This gives the oneway anova table----------------
summary(aov(IVD~Temp,data=aovdata))
#----------anova - First two treatments only------------------------
IVD1<-IVD[1:8];Temp1<-Temp[1:8];aovdata1<-data.frame(IVD1, Temp1)
summary(aov(IVD1~Temp1,data=aovdata1))
#----------Here are the t-tests-----------------------------
t.test(IVD[1:4], IVD[5:8], alternative = "two.sided",mu = 0, paired = F, var.equal = T)
mean(IVD[1:4])-mean(IVD[5:8]);sqrt(mean(var(IVD[1:4])+var(IVD[5:8])))
t.test(IVD[9:12], IVD[13:16], alternative = "two.sided",mu = 0, paired = F, var.equal = T)
mean(IVD[9:12])-mean(IVD[13:16]);sqrt(mean(var(IVD[9:12])+var(IVD[13:16])))
t.test(IVD[1:4]+IVD[5:8],IVD[9:12]+IVD[13:16],alternative = "two.sided",mu = 0, paired = F, var.equal = T)
mean(IVD[1:4]+IVD[5:8])-mean(IVD[9:12]+IVD[13:16])
sqrt(mean(var(IVD[1:4]+IVD[5:8])+var(IVD[9:12]+IVD[13:16])))
#----------Adding up the contrast SS------------------------
t1<-mean(IVD[1:4])-mean(IVD[5:8])
t2<-mean(IVD[9:12])-mean(IVD[13:16])
t3<-mean(IVD[1:4]+IVD[5:8])-mean(IVD[9:12]+IVD[13:16])
#------Treatment SS----------------------------------
(t1^2/(2/4))+(t2^2/(2/4))+(t3^2/(4/4))
#------t test variances------------------------------
s1<-var(IVD[1:4])
s2<-var(IVD[5:8])
s3<-var(IVD[9:12])
s4<-var(IVD[13:16])
#------------Within SS-------------------------------
3*(var(IVD[1:4])+var(IVD[5:8])+var(IVD[9:12])+var(IVD[13:16]))
s1+s2+s3+s4
