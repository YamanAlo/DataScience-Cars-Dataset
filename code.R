install.packages("ggplot2")
install.packages("pastecs")
install.packages("corrplot")
install.packages("GGally")                 
install.packages("dplyr")
install.packages("ggpubr")
install.packages("scales")
install.packages("moments")
install.packages("ggstatsplot")
install.packages("superml")
install.packages("readxl")
install.packages("zoo")
install.packages("imputeTS")
install.packages("reshape2")
install.packages("viridis")
install.packages("caTools")

library(caTools)
library(viridis)
library(reshape2)
library(imputeTS)
library(zoo)
library("GGally")  
library("readxl")
library(dplyr)
library(ggplot2)
library(pastecs)
library(corrplot)
library("ggpubr")
library(scales)
library(ggstatsplot)
library(superml)

#reading the file
library(readxl)
data <- read.csv("Data.csv")
View(data)
head(data)
nrow(data)
ncol(data)
summary(data)
stem(data$Price)
stat.desc(data$Price)
quantile(data$Price)
mean(data$Price)
sd(data$Price)
print(" Price Coefficient of variation is: ") 
sd(data$Price) / mean(data$Price)

table(data$Age)
table(data$FuelType)
table(data$MetColor)
table(data$Automatic)
table(data$Doors)

#Checking if there is NA Values
colSums(is.na(data))

#Visualizations:

#1- Age of the car in months
hist(data$Age, col='lightblue', main='Age Distribution')


#2- gear type
common_theme <- theme(plot.title = element_text(hjust = 0.55, face = "bold"))

ggplot(data = data, aes(x = factor(Automatic), 
                        y = prop.table(stat(count)), fill = factor(Automatic),
                        label = scales::percent(prop.table(stat(count))))) +
  geom_bar(position = "dodge") + 
  geom_text(stat = 'count',
            position = position_dodge(.9), 
            vjust = -0.55, 
            size = 4) + 
  scale_y_continuous(labels = scales::percent)+
  labs(x = 'Automatic', y = 'Percentage') +
  ggtitle("Manual vs Automatic") +
  common_theme

#3- Fuel Type
common_theme <- theme(plot.title = element_text(hjust = 0.55, face = "bold"))

ggplot(data = data, aes(x = factor(FuelType), 
                        y = prop.table(stat(count)), fill = factor(FuelType),
                        label = scales::percent(prop.table(stat(count))))) +
  geom_bar(position = "dodge") + 
  geom_text(stat = 'count',
            position = position_dodge(.9), 
            vjust = -0.55, 
            size = 4) + 
  scale_y_continuous(labels = scales::percent)+
  labs(x = 'Fuel Type', y = 'Percentage') +
  ggtitle("Distribution of Fuel Types") +
  common_theme


#4- MetColor wheather it has a metalic color or not
common_theme <- theme(plot.title = element_text(hjust = 0.55, face = "bold"))

ggplot(data = data, aes(x = factor(MetColor), 
                        y = prop.table(stat(count)), fill = factor(MetColor),
                        label = scales::percent(prop.table(stat(count))))) +
  geom_bar(position = "dodge") + 
  geom_text(stat = 'count',
            position = position_dodge(.9), 
            vjust = -0.55, 
            size = 4) + 
  scale_x_discrete(labels = c("No Metalic", "Metalic"))+
  scale_y_continuous(labels = scales::percent)+
  labs(x = 'MetColor', y = 'Percentage') +
  ggtitle("Distribution of Metalic Color") +
  common_theme

#5- Doors
common_theme <- theme(plot.title = element_text(hjust = 0.55, face = "bold"))

ggplot(data = data, aes(x = factor(Doors), 
                        y = prop.table(stat(count)), fill = factor(Doors),
                        label = scales::percent(prop.table(stat(count))))) +
  geom_bar(position = "dodge") + 
  geom_text(stat = 'count',
            position = position_dodge(.9), 
            vjust = -0.55, 
            size = 4) + 
  scale_y_continuous(labels = scales::percent)+
  labs(x = 'Doors', y = 'Percentage') +
  ggtitle("Total Doors in a Car") +
  common_theme

#6- Weight
hist(data$Weight, col='gold', main='Weight Distribution')

#7- CC which is engine size
hist(data$CC, col='blue', main='Engine Size Distribution')

#8- KM
hist(data$KM, col='red', main='Kilometer Distribution')

#9- Price 

hist(data$Price, col='green', main='Price Distribution')

# Scatter Plots:
 
#1- Age Vs KM 
ggplot(data, aes(x = Age, y = KM)) +
  geom_point() +
  labs(x = "Age", y = "KM") +
  ggtitle("Age vs KM") +
  theme(plot.title = element_text(hjust = 0.5))

#2- Age vs Price
ggplot(data, aes(x = Age, y = Price)) +
  geom_point() +
  labs(x = "Age", y = "Price") +
  ggtitle("Age vs Price") +
  theme(plot.title = element_text(hjust = 0.5))

#3- KM Vs Price
ggplot(data, aes(x = KM, y = Price)) +
  geom_point() +
  labs(x = "KM", y = "Price") +
  ggtitle("Kilometers vs Price") +
  theme(plot.title = element_text(hjust = 0.5))

#4-KM Vs Price based on Fuel Type
ggplot(data, aes(x = KM, y = Price, color = FuelType)) +
geom_point() +
  labs(x = "KM", y = "Price") +
  ggtitle("Km vs Price via Fuel Type") +
  scale_color_manual(values = c("Diesel" = "blue", "Petrol" = "green", "CNG" = "purple"
                              )) +
  theme(plot.title = element_text(hjust = 0.5))


# Box Plots:

#1- Boxplot For Price
boxplot(data$Price, width = 0.5, height = 0.6, col = "steelblue", main = "Price")

#2- Age Boxplot
boxplot(data$Age, width = 0.5, height = 0.6, col = "gold", main = "Age")

#3- HP Boxplot
boxplot(data$HP, width = 0.5, height = 0.6, col = "red", main = "HP")


#4- Weight boxPlot
boxplot(data$Weight, width = 0.5, height = 0.6, col = "yellow", main = "Weight")

#5- Engine Size BoxPlot
boxplot(data$CC, width = 0.5, height = 0.6, col = "purple", main = "CC")

#6- Box plot of Price and FuelType
ggplot(data, aes(x = factor(FuelType), y = Price)) + geom_boxplot() + 
  geom_boxplot(fill = "blue", color = "black") +
  labs(x = 'Fuel Type', y = 'Price') +
  ggtitle("Boxplot of price and Fuel type ") + common_theme

#7- Price and Transmission 
ggplot(data, aes(x = factor(Automatic), y = Price)) + geom_boxplot() + 
  geom_boxplot(fill = "gold", color = "black") +
  labs(x = 'Transmission', y = 'Price') +
  ggtitle("Boxplot of Transmisson and Price ") + common_theme

#8-Price and Metcolor
ggplot(data, aes(x = factor(MetColor), y = Price)) + geom_boxplot() + 
geom_boxplot(fill = "red", color = "black") +
  labs(x = 'Metalic Color', y = 'Price') +
  ggtitle("Boxplot of MetColor and Price ") + common_theme

#9-Price and Doors

ggplot(data, aes(x = factor(Doors), y = Price)) + geom_boxplot() + 
  geom_boxplot(fill = "green", color = "black") +
  labs(x = 'Doors', y = 'Price') +
  ggtitle("Boxplot of Doors and Price ") + common_theme



#Normality Tests and Non-parametric tests

for (col in colnames(data)) {
  # Convert categorical variable(FuelType) to numerical representation
  numerical_data <- as.integer(factor(data[[col]]))
  
  
  result <- shapiro.test(numerical_data)
  
  cat("Feature:", col, "\n")
  cat("Statistic:", result$statistic, "\n")
  cat("p-value:", result$p.value, "\n")
  cat("Normality:", ifelse(result$p.value < 0.05, "Rejected", "Accepted"), "\n\n")
}


for (col in colnames(data)) {
  numerical_data <- as.integer(factor(data[[col]]))
  
  result <- ks.test(numerical_data, "pnorm",mean(numerical_data) ,sd(numerical_data))
  
  cat("Feature:", col, "\n")
  cat("Statistic:", result$statistic, "\n")
  cat("p-value:", result$p.value, "\n")
  cat("Normality:", ifelse(result$p.value < 0.05, "Rejected", "Accepted"), "\n\n")
}



#Confidence intervals and Point Estimations
mean(data$Price, na.rm = TRUE)
# Sample size, std, margin
n <- length(data$Price)
xbar <- mean(data$Price, na.rm = TRUE)
s <- sd(data$Price)
margin <- qt(0.975, df=n-1)*s/sqrt(n)
low <- xbar - margin
print(low)
high <- xbar + margin
print(high)
cat("CI=",low, " < mu < ", high)


#Hypotheses Tests: 

#1-Price and Age
#Null Hypothesis: There is no significant relationship between the age of a car and its price.
#Alternative Hypothesis: The age of a car has a significant impact on its price.

young <- data$Price[data$Age <35 ]
old<- data$Price[data$Age >= 36]

# Perform an independent t-test
result <- t.test(young, old)

# Print the t-test result
print(result)

#2- FuelType and Price:

#Null Hypothesis: There is no significant difference in the prices of cars based on their fuel type.
#Alternative Hypothesis: The fuel type has a significant impact on the prices of cars.

diesel <- data$Price[data$FuelType == "Diesel"]
petrol <- data$Price[data$FuelType == "Petrol"]
result <- t.test(diesel, petrol)
print(result)


#Since the p-value is non significant we accept the null hypothesis and reject the alternative.


# price and age
correlation_test <- cor.test(data$Price , data$Age)
print(correlation_test)


#3- Transmission and Price
#Null Hypothesis: There is no significant difference in the prices of cars based on their transmission type (automatic vs. manual).
#Alternative Hypothesis: The transmission type has a significant impact on the prices of cars.

Automatic <- data$Price[data$Automatic == 1]
Manual <- data$Price[data$Automatic == 0]
result <- t.test(Automatic, Manual)
print(result)

correlation_test <- cor.test(data$Price , data$Automatic)
print(correlation_test)

#Since the p-value is non significant we accept the null hypothesis and reject the alternative.


#4- Km and price 
plot(data$KM, data$Price, xlab = "Kilometers Driven", ylab = "Price", main = "Scatter Plot: Kilometers Driven vs. Price")

# Perform correlation analysis
correlation <- cor(data$KM, data$Price)
print(correlation)

# this indicates a negative relationship between the 2 variables.


# Goodness of Fit:

#1-on the CC column
table(data$CC)
chisq.test(table(data$CC))

table(data$CC ,data$Weight)
chisq.test(table(data$CC ,data$Weight))

observed <- table(data$FuelType)
expected <- c(0.012 * 1436, 0.108 * 1436 ,0.88 * 1436 ) 
total <- sum(expected)
expected_prob <- expected / total

result <- chisq.test(observed, p = expected_prob)
print(result)

#Non parametric tests
kruskal_result <- kruskal.test(Price ~ FuelType, data = data)
print(kruskal_result)

kruskal_result <- kruskal.test(Price ~HP , data = data)
kruskal_result

kruskal.test(Price ~ CC ,data = data)

#Data Encoding: 
#1. Fuel Type:
label <- LabelEncoder$new()
print(label$fit(data$FuelType))
data$FuelType <- label$fit_transform(data$FuelType)
print(data$FuelType)

#Linear Regression
split = sample.split(data$Price, SplitRatio = 0.7)
trainingset = subset(data, split == TRUE)
testset = subset(data, split == FALSE)
price.lm<-lm(Price ~ KM + Age + FuelType + HP + CC + Doors + Weight + Automatic + MetColor ,data =data)
summary(price.lm)

par(mfrow=c(2,2))
plot(price.lm)
par(mfrow=c(1,1))

#ANOVA
data$HP <- as.factor(data$HP)
anova1 <- aov(Price ~ HP, data = data)
summary(anova1)
TukeyHSD(anova1)
plot(TukeyHSD(anova1))

data$CC <- as.factor(data$CC)

anova_result <- aov(Price ~ CC, data = data)
summary(anova_result)
TukeyHSD(anova_result)
plot(TukeyHSD(anova_result))


anova_result <- anova(lm(Price ~ KM + Age + FuelType + HP + CC + Doors + Weight + Automatic + MetColor, data = data))
print(anova_result)



