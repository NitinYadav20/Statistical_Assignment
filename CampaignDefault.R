
bank <- read.csv("C:/Users/User/Downloads/bank-additional/bank-additional/bank-additional.csv")

x<-bank$default
y <-bank$campaign

regression <- lm(y~x)

summary(regression)
confint(regression)

plot(regression)


