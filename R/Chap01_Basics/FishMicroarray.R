fish_microarray <- read.table("../../data/FishTissueMass.txt", header=T)
fish_microarray$hCG <- as.factor(fish_microarray$hCG)
print(fish_microarray)
mat <- contr.poly(fish_microarray)
# It's not clear to me what to assign this to...
model1 <- aov(Y ~ TissueMass + hCG, data=fish_microarray)
summary(model1)
