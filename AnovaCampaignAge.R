bank <- read.csv("C:/Users/User/Downloads/bank-additional/bank-additional/bank-additional.csv")



x<-bank$age
y <-bank$campaign



Combined_Groups <- data.frame(cbind(x, y)) # combines the data into a single data set.
Combined_Groups # shows spreadsheet like results
summary(Combined_Groups)  # min, median, mean, max

Stacked_Groups <- stack(Combined_Groups)
Stacked_Groups #shows the table Stacked_Groups

Anova_Results <- aov(values ~ ind, data = Stacked_Groups) 
summary(Anova_Results) # shows Anova_Results

plot(Anova_Results)

