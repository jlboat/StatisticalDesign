cat("Chapter 1: Basics p.12-13\n")
rehab_data <- read.table("../../data/RehabTime.txt", header=T)
rehab_data$PhysicalConditionCode <- as.factor(rehab_data$PhysicalConditionCode)
print(rehab_data)
mat <- contr.helmert(4)
print(as.factor(rehab_data$PhysicalConditionCode))
print(mat)
contrasts(rehab_data$PhysicalConditionCode) <- mat

model1 <- aov(RehabTime ~ PhysicalConditionCode, rehab_data)
summary(model1)
cat("\nNote: I believe these are mislabelled in the textbook\n")
summary.aov(model1, split=list(PhysicalConditionCode=list("Excellent vs. Others"=3, "Below vs. Above/Excellent"=2, "Poor vs. Below"=1)))
