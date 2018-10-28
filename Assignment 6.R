library(tibble)
library(gapminder)
library(tidyverse)

DS = tribble(
  ~fk_account_code, ~Ansvar, ~fk_function_code, ~fk_project_code, ~amount,
  101030,40220,"Det",3432,1493.00,
  101030,40220,"Met",3586,2827.00,
  101030,40320,"Det",3456,49440.00,
  101030,40330,"Sal",NA,870716.00,
  101030,40350,"Met",NA,559928.00,
  101030,40360,"Sal",NA,125534.00,
  101030,40280,"Pol",NA,251611.00)

DS$fk_project_code <- NULL

DS$fk_function_code <- ordered(DS$fk_function_code,
                     levels = c("Det","Sal", "Met", "Pol"),
                     labels = c("Supplies", "Supplies", "Inventories", "Exopenses"))


# Task 2

df <- data.frame(Product=gl(3,10,labels=c("A","B", "C")), 
                 Year=factor(rep(2002:2011,3)), 
                 Sales=1:30)
A <- df %>%
  filter(Product == "A") %>%
  mutate(Sales_share = Sales/55)

B <- df %>%
  filter(Product == "B") %>%
  mutate(Sales_share = Sales/165)

C <- df %>%
  filter(Product == "C") %>%
  mutate(Sales_share = Sales/255)

df <- rbind(A, B, C)
