# chapter 4, programming basics
# 4.1 conditional expressions

a <- 4

if(a!=0){
  print(1/a)
} else{
  print("0 sonining teskarisi yo'q")
}

1/4




a <- 0

if(a!=0){
  print(1/a)
} else{
  print("0 sonining teskarisi yo'q")
}
1/0


library(dslabs)
data("murders")
murder_rate <- murders$total  / murders$population*100000
murder_rate

ind <- which.min(murder_rate)


if(murder_rate[ind] < 0.5){
  print(murders$state[ind])
}else{
  print("Hech qaysi hududda bunchalik kichik qiymat yo'q")
}




if(murder_rate[ind] < 0.25){
  print(murders$state[ind])
}else{
  print("Hech qaysi hududda bunchalik kichik qiymat yo'q")
}


a <- 10
ifelse(a >0, 1/a, NA)


a <- -10
ifelse(a >0, 1/a, NA)

a <- -10
ifelse(a >0, 1/a, a*2)


a <- c(0,1,2,-4,5)

result <- ifelse(a >0, 1/a, NA)
result



data("na_example")

na_example
length(na_example)

sum(is.na(na_example))

na_example


no_nas <- ifelse(is.na(na_example), 0, na_example)
no_nas
sum(is.na(no_nas))



z <- c(TRUE, TRUE, FALSE)
any(z)

all(z)
