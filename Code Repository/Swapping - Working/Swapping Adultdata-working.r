# Load necessary libraries
library(dplyr)


dataforswapping <- read.csv("C:/Resources/Dissertation/Anonymisation/Swapping - Working/adultdataforswapping.csv")
head(dataforswapping)
# Function to perform data swapping
swapdata <- function(data, column_name) {
  shuffled_column <- sample(data[[column_name]])
  data[[column_name]] <- shuffled_column
  return(data)
}

# Anonymize the Age and income columns using data swapping
anonymized_data <- dataforswapping %>%
  swapdata("Age") %>%
  swapdata("income")
#print(anonymized_data)

write.csv(anonymized_data,"C:/Resources/Dissertation/Anonymisation/Swapping - Working/adultdataswapped.csv",row.names = FALSE)

readswappeddata <- read.csv("C:/Resources/Dissertation/Anonymisation/Swapping - Working/adultdataswapped.csv")
head(readswappeddata)


