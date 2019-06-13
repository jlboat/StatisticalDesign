library(reshape)

cat("Chapter 1: Basics p.20-23\n")
data <- read.table("../../data/DataLayout.txt",header=T)
cat("\nExample 1.22\n")
print(cast(data, Fert ~ Hybrid))

model1 <- aov(Yield ~ Fert + Hybrid + Fert*Hybrid, data)
summary(model1)
