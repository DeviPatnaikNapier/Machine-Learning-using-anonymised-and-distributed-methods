library(dplyr)
library(stringi)

dataforsuppression <- read.csv("C:/Resources/Dissertation/Anonymisation/Suppression - Working/adultdataforsuppression.csv")
head(dataforsuppression)
generalise_string <- function(text)
{
  text <- stri_trans_tolower(text)
  text <- stri_replace_all_regex(text,"\\d","*")
  text <- stri_replace_all_regex(text,"[^[:alnum:]]","*")
  text <- stri_trim_both(text)
  
  return(text)
  
}

anonymise_col <- function(dataforsuppression, col_name)
{
  dataforsuppression <- dataforsuppression %>%
    mutate(across(all_of(col_name),generalise_string))
   return(dataforsuppression)
}

col_to_anonymise <- c("Final.Weight", "Education.Number.of.Years", "Hours.per.week")

for (column in col_to_anonymise)
{
  dataforsuppression <- anonymise_col(dataforsuppression,column)
  
  
}
#head(dataforsuppression)
write.csv(dataforsuppression,"C:/Resources/Dissertation/Anonymisation/Suppression - Working/adultdataforsuppressed.csv",row.names = FALSE)

readsuppresseddata <- read.csv("C:/Resources/Dissertation/Anonymisation/Suppression - Working/adultdataforsuppressed.csv")
head(readsuppresseddata)