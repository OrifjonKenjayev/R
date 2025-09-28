# 3.12 Vector arithmetics

library(dslabs)
data("murders")

murders$state[which.max(murders$population)]


max(murders$population)


inches <- c(69, 62, 66, 70, 70, 73, 67, 73, 67, 70)

inches * 2.54

inches - 69

c(1,5,2) + c(8, 0, -9)

murder_rate <- murders$total / murders$population * 100000
murder_rate

murders$state[order(murder_rate)]


ind <- murder_rate < 0.71
ind

ind <- murder_rate <= 0.71
ind


murders$state[ind]

sum(ind)



TRUE & TRUE

TRUE & FALSE
FALSE & TRUE
FALSE & FALSE


View(murders)



west <- murders$region == "West"
west


safe <- murder_rate <= 1
ind <- safe & west
murders$state[ind]




ind <- which(murders$state == "California")
murder_rate[ind]


ind <- match(c("New York", "Florida", "Texas"), murders$state)
ind

murder_rate[ind]


c("Boston", "Dakota", "Washington") %in% murders$state

c("Buxoro", "Dakota", "Washington") %in% murders$state



match(c("New York", "Florida", "Texas"), murders$state)

which(murders$state%in%c("New York", "Florida", "Texas"))


