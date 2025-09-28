# 3.16 basic plots

library(dslabs)
data("murders")

x <- murders$population / 10^6
y <- murders$total

plot(x,y)

with(murders, plot(population, total))


x <- with(murders, total / population * 100000)
hist(x)


murders$state[which.max(x)]




# box plot

murders$rate <- with(murders, total/ population * 100000)
murders

boxplot(rate ~ region, data = murders)

x <- matrix(1:120, 12, 10)
image(x)
x
