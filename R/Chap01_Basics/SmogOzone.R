smog_ozone <- read.table("../../data/SmogOzone.txt", header=T)
smog_ozone$PPM <- as.factor(smog_ozone$PPM)
head(smog_ozone)
summary(smog_ozone)

c1 <- c(-2,1,1)
c2 <- c(0,-1,1)

mat <- cbind(c1, c2)

contrasts(smog_ozone$PPM) <- mat
mat
model <- aov(WtGain ~ PPM, smog_ozone)
summary(model)

summary.aov(model, split=list(PPM=list("(0.3PPM+0.6PPM) - Control"=1, "0.6PPM - 0.3PPM"=2)))

# cat("\nHelmert\n")
# mat <- contr.helmert(3)
# mat
# contrasts(smog_ozone$PPM) <- mat
# summary.aov(model, split=list(PPM=list("0.3PPM - Control"=1, "0.6PPM - Control"=2,"0.6PPM - 0.3PPM"=3)))

cat("\nPolynomial\n")
mat <- contr.poly(3)
mat
contrasts(smog_ozone$PPM) <- mat
summary.aov(model, split=list(PPM=list("Linear"=1, "Quadratic"=2)))
