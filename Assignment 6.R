library(tibble)
library(data.table)
library(tidyverse)

# Task 1
DS = tribble(
  ~fk_account_code, ~Ansvar, ~fk_function_code, ~fk_project_code, ~amount,
  101030,40220,"Det",3432,1493.00,
  101030,40220,"Met",3586,2827.00,
  101030,40320,"Det",3456,49440.00,
  101030,40330,"Sal",NA,870716.00,
  101030,40350,"Met",NA,559928.00,
  101030,40360,"Sal",NA,125534.00,
  101030,40280,"Pol",NA,251611.00)

# 1
DS$fk_project_code <- NULL

# 2
DS$Ansvar <- as.character(DS$Ansvar)
str(DS)

DS <- separate(DS, Ansvar, into = c("Ansvar1_3", "rest"), sep = 3)
DS %>% group_by(Ansvar1_3) %>% summarise(sum=sum(amount))

# 3
DS$fk_function_code <- ordered(DS$fk_function_code,
                     levels = c("Det","Sal", "Met", "Pol"),
                     labels = c("Supplies", "Supplies", "Inventories", "Other Expenses"))


# Task 2

# 1
df <- data.frame(Product=gl(3,10,labels=c("A","B", "C")), 
                 Year=factor(rep(2002:2011,3)), 
                 Sales=1:30)

DT <- data.table(df)
str(DT)
# When using data.table, choose index or key variable
setkey(DT, "Year")
# Calculate shares by Year
DT <- DT[ , Share :=  Sales/sum(Sales), by=list(Year)]

# 2

library(latticeExtra)

  
xyplot(Sales +Share ~ Year, groups=Product, data = DT,
       t="b", scales =list(relation="free", x=list(rot=45),
       auto.key = list(space="top", column = 3), 
       main="Product information")
