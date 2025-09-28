# 3.10 Sorting

library(dslabs)
data("murders")
murders

sort(murders$total)



x <- c(31,4,15,92,65)
x

sort(x)


order(x)


index <- order(x)

x[index]
x


ind <- order(murders$total)
murders$abb[ind]
murders$state[ind]

View(murders)



max(murders$total)

i_max <- which.max(murders$total)

murders$state[i_max]

min(murders$total)
i_min <- which.min(murders$total)
murders$state[i_min]


x
rank(x)
sort(x)


a <- c(1,2,3)
b <- c(10,11,12,13,14,15,16)
a+b
