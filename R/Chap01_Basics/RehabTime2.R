cat("Chapter 1: Basics p.14\n")
rehab_data <- read.table("../../data/RehabTime2.txt", header=T)
rehab_data$PhysicalConditionCode <- as.factor(rehab_data$PhysicalConditionCode)
cat("\nNote: The data are now unbalanced between groups\n")
print(rehab_data)
# ORDER: Poor, Below, Above, Excellent
c1 <- c(1,-8/19,-7/19,-4/19) # Poor vs. Others
c2 <- c(0,1,-7/11,-4/11)     # Below vs. Above/Excellent
c3 <- c(0,0,1,-1)            # Excellent vs. Above

mat <- cbind(c1, c2, c3)
print(as.factor(rehab_data$PhysicalConditionCode))
cat("\nThe contrasts are uncorrelated but not orthogonal\n")
print(mat)
contrasts(rehab_data$PhysicalConditionCode) <- mat

model1 <- aov(RehabTime ~ PhysicalConditionCode, rehab_data)
summary(model1)
summary.aov(model1, split=list(PhysicalConditionCode=list("Poor vs. Others"=1, "Below vs. Above/Excellent"=2, "Excellent vs. Above"=3)))
