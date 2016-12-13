bank <- read.csv("C:/Users/User/Downloads/bank-additional/bank-additional/bank-additional.csv")

x<-bank$education
y <-bank$campaign

Combined_Groups <- data.frame(cbind(x, y)) 
Combined_Groups 
summary(Combined_Groups)  # min, median, mean, max

Stacked_Groups <- stack(Combined_Groups)
Stacked_Groups #shows the table Stacked_Groups

Anova_Results <- aov(values ~ ind, data = Stacked_Groups) 
summary(Anova_Results) # shows Anova_Results

plot(Anova_Results)

