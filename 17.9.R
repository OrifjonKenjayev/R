# 17.9 Exercise
# 1. Create this table:
# library(tidyverse)
# library(dslabs)
# data("polls_us_election_2016")
# polls <- polls_us_election_2016 %>%
#   filter(state != "U.S." & enddate >= "2016-10-31") %>%
#   mutate(spread = rawpoll_clinton/100 - rawpoll_trump/100)

# Now for each poll use the CLT to create a 95% confdence interval for the spread reported by each poll.
# Call the resulting object cis with columns lower and upper for the limits of the confdence intervals.
# Use the select function to keep the columns state, startdate, enddate, pollster, grade,
# spread, lower, upper.

polls <- polls_us_election_2016 %>%
  filter(state != "U.S." & enddate >= "2016-10-31") %>%
  mutate(spread = rawpoll_clinton/100 - rawpoll_trump/100)

cis <- polls |>
  mutate(lower = mean(spread) - qnorm(0.975) * sd(spread)/ sqrt(length(spread)),
         upper = mean(spread) + qnorm(0.975) * sd(spread)/ sqrt(length(spread))
         ) |> select(
           state, startdate, enddate, pollster, grade,
           spread, lower, upper
         )

# 2. You can add the fnal result to the cis table you just created using the right_join function like this:
# add <- results_us_election_2016 %>%
#  mutate(actual_spread = clinton/100 - trump/100) %>%
#  select(state, actual_spread)
# cis <- cis %>%
#  mutate(state = as.character(state)) %>%
#  left_join(add, by = "state")
# Now determine how often the 95% confdence interval includes the actual result.


add <- results_us_election_2016 %>%
  mutate(actual_spread = clinton/100 - trump/100) %>%
  select(state, actual_spread)
cis <- cis %>%
  mutate(state = as.character(state)) %>%
  left_join(add, by = "state")

cis2 <- cis

cis2 <- cis2 %>%
  mutate(hit = 
           ifelse(lower <= actual_spread & upper >= actual_spread, TRUE, FALSE)
           )
# 3. Repeat this, but show the proportion of hits for each pollster. Show only pollsters with more than 5
# polls and order them from best to worst. Show the number of polls conducted by each pollster and the
# FiveThirtyEight grade of each pollster. Hint: use n=n(), grade = grade[1] in the call to summarize. 

cis2 <- cis2 |>
  group_by(pollster) |>
  filter(n() > 5 ) |>
  summarize(p = mean(hit), n = n(), grade = grade[1]) 

cis2 <- cis2 |> arrange(desc(p))

# 4. Repeat exercise 3, but instead of pollster, stratify by state. Note that here we can’t show grades.

cis3 <- cis3 %>% 
  group_by(state) %>%
  filter(n() > 5) %>%
  summarise(p = mean(hit), n = n())
cis3 <- cis3 |> arrange(desc(p))
View(cis3)

# 5. Make a barplot based on the result of exercise 4. Use coord_flip.

cis3 %>% ggplot(aes(p))+ geom_bar()+ coord_flip()

# 6. Add two columns to the cis table by computing, for each poll, the diﬀerence between the predicted
# spread and the actual spread, and defne a column hit that is true if the signs are the same. Hint: use
# the function sign. Call the object resids.
resids <- cis %>% mutate( hit = sign(spread - actual_spread))

# 7. Create a plot like in exercise 5, but for the proportion of times the sign of the spread agreed.
resids %>% 
  group_by(state) %>% 
  filter(n() >5 ) %>% 
  summarise(p = mean(hit)) %>% 
  ggplot(aes(p)) + geom_bar() + coord_flip()

# 8. In exercise 7, we see that for most states the polls had it right 100% of the time. For only 9 states
# did the polls miss more than 25% of the time. In particular, notice that in Wisconsin every single poll
# got it wrong. In Pennsylvania and Michigan more than 90% of the polls had the signs wrong. Make a
# histogram of the errors. What is the median of these errors?

a <- resids %>% group_by(state) %>% summarise(error = spread - actual_spread)
hist(a$error)

# 9. We see that at the state level, the median error was 3% in favor of Clinton. The distribution is not
# centered at 0, but at 0.03. This is the general bias we described in the section above. Create a boxplot
# to see if the bias was general to all states or it aﬀected some states diﬀerently. Use filter(grade
#      %in% c("A+","A","A-","B+") | is.na(grade))) to only include pollsters with high grades.

resids <-  resids %>% group_by(state) %>% mutate(error = spread - actual_spread)
resids %>% group_by(state) %>%  ggplot(aes(error)) + geom_boxplot()  

# 10. Some of these states only have a few polls. Repeat exercise 9, but only include states with 5 good polls
# or more. Hint: use group_by, filter then ungroup. You will see that the West (Washington, New
#                                                                              Mexico, California) underestimated Hillary’s performance, while the Midwest (Michigan, Pennsylvania,
#                                                                                                                                                           Wisconsin, Ohio, Missouri) overestimated it. In our simulation, we did not model this behavior since we
# added general bias, rather than a regional bias. Note that some pollsters may now modeling correlation
# between similar states and estimating this correlation from historical data. To learn more about this,
#you can learn about random eﬀects and mixed models.  
  
  
  