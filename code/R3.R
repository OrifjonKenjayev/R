library(dslabs)
library(tidyverse)

n <- 15
x <- seq(5, n)
print(x)
sum(x)
5+6+7


class(n)








data(murders)


class(murders)



str(murders)
head(murders)

names(murders)



murders$population


a <- murders$abb
length(a)


z <- 3 < 2
class(z)
z


?Comparison

murders$region
levels(murders$region)



mat <- matrix(1:12, 4:3)
mat


mat[2,3]

mat[2,]
mat[,3]


mat[,2:3]

mat[1:2, 2:3]



as.data.frame(mat)


data("murders")
murders[25,1]
murders[1,1]
head(murders)
