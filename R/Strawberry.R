#source("c:/Work07/StatDesign07/Programs/R/Examples/Strawberry.txt",print.eval=TRUE)#
#Does t-test for Strawberry data
A<-c(10.1,10.8,9.8,10.5)
B<-c(6.3,6.9,5.3,6.2)
C<-c(8.4,9.4,9.0,9.2)
#--------RCB ANOVA - A, B and C---------------------
yield<-c(A,B,C)
trt<-rep(c("A","B","C"),each=4)
block <- rep(c("1","2","3","4"),each=1,times=3)
strawdata <- data.frame(yield,block,trt)
summary(aov(yield ~ block + trt,strawdata))
#--------RCB ANOVA - Just A and B---------------------
t.test(A-B)
yield<-c(A,B)
trt<-rep(c("A","B"),each=4)
block <- rep(c("1","2","3","4"),each=1,times=2)
strawdata <- data.frame(yield,block,trt)
summary(aov(yield ~ block + trt,strawdata))
#--------RCB ANOVA - .5*A+.5*B-C---------------------
t.test(.5*A+.5*B-C)
yield<-c(.5*A+.5*B,C)
trt<-rep(c(".5*A+.5*B","C"),each=4)
block <- rep(c("1","2","3","4"),each=1,times=2)
strawdata <- data.frame(yield,block,trt)
summary(aov(yield ~ block + trt,strawdata))