require(foreign)
require(ggplot2)
require(MASS)
require(Hmisc)
require(reshape2)
require(plyr)
library(nnet)
library(dplyr)
library(ggplot2)
library(plotly)
library(grid)
library(gridExtra)
library(DT)
library(GGally)
library(randomForest)
x=read.csv("/Users/nitinyadav/Desktop/statistic project/statsproject.csv")
fit1<-multinom(LOAN~x$age+JOB+EDUCATION+MARITAL)
summary(fit1)
head(fitted(fit1))
x1 = data.frame(LOAN,x$age,JOB,EDUCATION,MARITAL)
fit1 <- polr(x$loan ~ x$age + x$job + x$education + x$marital ,data = x, Hess=TRUE)
summary(fit1)
head(fitted(fit1))
ctable1 <- coef(summary(fit1))
p1 <- pnorm(abs(ctable1[, "t value"]), lower.tail = FALSE)*2
ci1 <- confint(fit1)
exp(coef(fit1))
exp(cbind(OR = coef(fit1), ci1))
summary(fit1)
summary(update(fit1, method = "probit", Hess = TRUE) , digits = 4)
summary(update(fit1, method = "logistic", Hess = TRUE) , digits = 4)
summary(update(fit1, method = "cloglog", Hess = TRUE) , digits = 4)
head(predict(fit1, x1, type = "p"))
addterm(fit1, ~.^2, test = "Chisq")
fit11 <- stepAIC(fit1, ~.^2)
fit11
summary(fit11)
fit11$anova
anova(fit1, fit11)
fit111 <- update(fit1, Hess = TRUE)
pr1 = profile(fit111)
confint(pr1)
plot(pr1)
pairs(pr1)











