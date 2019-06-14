avocado_data <- read.table("../../data/Avocado.txt", header=T)
avocado_data$Shipping <- as.factor(avocado_data$Shipping)
avocado_data$Storage <- as.factor(avocado_data$Storage)
avocado_data$Block <- as.factor(avocado_data$Block)
summary(avocado_data)
head(avocado_data)

model1 <- aov(Y ~ Shipping + Block + Storage + Shipping*Storage, data=avocado_data)
summary(model1)

model2 <- aov(Y ~ Shipping + Block + Storage + Shipping*Storage + 
              Error(Block*Shipping + Block*Storage + Block*Shipping*Storage), 
          data=avocado_data)
summary(model2)

#model3 <- aov(Y ~ Shipping + Block + Storage + Shipping*Storage + Error(Block*(Shipping*Storage)), data=avocado_data)
#summary(model3)
