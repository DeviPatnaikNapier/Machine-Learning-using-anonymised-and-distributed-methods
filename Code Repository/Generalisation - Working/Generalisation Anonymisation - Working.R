library(dplyr)
library(stringi)

data <- read.csv("C:/Resources/Dissertation/Anonymisation/Anonymise sample data.csv")

generalise_string <- function(text)
{
  text <- stri_trans_tolower(text)
  text <- stri_replace_all_regex(text,"\\d","X")
  text <- stri_replace_all_regex(text,"[^[:alnum:]]","X")
  text <- stri_trim_both(text)
  
  return(text)
  
}

anonymise_col <- function(data, col_name)
{
  data <- data %>%
    mutate(across(all_of(col_name),generalise_string))
   return(data)
}

col_to_anonymise <- c("Name","Address","PostCode")

for (column in col_to_anonymise)
{
  data <- anonymise_col(data,column)
  
  
}
write.csv(data,"C:/Resources/Dissertation/Anonymisation/Anonymised sample data.csv",row.names = FALSE)

data1 <- read.csv("C:/Resources/Dissertation/Anonymisation/Anonymised sample data.csv")
head(data1)