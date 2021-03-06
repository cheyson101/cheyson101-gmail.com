
rm(list = ls())

getwd()

setwd("C:/Users/Roland/Documents/System Simulation")

getwd()

# Read Data


data <- read.csv("mroz.csv", header=TRUE, na.strings = ".")

str(data) #viewe the structure of the data

summary(data) # summary of stats for all variables in the dataset

cor(data)


# Dealing with Missing values

cor(data[c("educ", "wage")])

?cor

cor(data[c("educ", "wage")], use = "complete")

# Summary stats for selected variables

summary(data[c("hours", "husage")]) #  dataset with correlation between hours and husbands age
cor(data[c("educ", "motheduc", "fatheduc")]) # correlation of education with mothers education and fathers education
# boxplots
boxplot(data)

# summary using subsets

data.sub0 <- subset(data, select = c("hours", "husage"))
summary(data.sub0)
cor(data.sub0)
barplot(x, y)

x <- data$hours
y <- data$husage



# summary using subsets of data

data.sub1 <- subset(data, hours > 0) # limitting the analysis only to those who are working
cor(data.sub1[c("educ", "wage")])

data.sub1 <- subset(data, hours >0, select = c("educ", "wage"))
cor(data.sub1)


# categorical variables
library(mosaic)

# calculate the basic descriptive stats
(descStat <- tally(data))

tally(~kidslt6, mydata=data, margins = TRUE)  # counts
tally(~kidslt6, mydata=data, margins = TRUE, format = "perc") # Percetage
tally(~kidslt6, mydata=data, margins = TRUE, format = "prop") # Proportion

# Contingency Tables

tally (~kidsage6+kidslt6, mydat=data, margins = TRUE) #Counts

# Conditioal Table

tally (~kidsage6|educ >=16, mydat=data, margins = TRUE, format = "prop") #poportion

# Continuous Variables

mean(~wage, mydata=data, na.rm=TRUE)

favstats(~wage, mydata=data)

# apply this to several variables

data.sub2 <- subset(data, slect = c("hours", "husage", "wage", "huswage"))

dfapply(data.sub2, favstats)


hist(data$hours, freq = TRUE)
x1 <- 10:100
lines(x1, dnorm(x1, mean(data$hours), sd(data$hours)))

hist(data$husage, freq = FALSE)
lines(x1, dnorm(x1, mean(data$husage), sd(data$husage)))

hist(data$huswage, freq = FALSE)
lines(x1, dnorm(x1, mean(data$huswage), sd(data$huswage)))

hist(data$wage, freq = FALSE)
x2 <- seq(0,14,0.1)
lines(x2, dnorm(x2, mean(data$wage), sd(data$wage)))


