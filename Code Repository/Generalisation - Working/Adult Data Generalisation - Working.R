# Load required libraries
library(dplyr)

# Load the dataset
adultdata<- read.csv("C:/Resources/Dissertation/Anonymisation/Generalisation - Working/adultdatageneralisation.csv")

# Display the first few rows of the dataset
head(adultdata)

# Generalize the dataset by rounding numerical columns
generalise_data <- adultdata %>%
  mutate(Age = round(Age, -1), 
         Final.Weight = round(Final.Weight, -4), 
         Education.Number.of.Years = round(Education.Number.of.Years, -1), 
         Hours.per.week = round(Hours.per.week, -1))

# Display the first few rows of the generalized dataset
head(generalise_data)
write.csv(generalise_data,"C:/Resources/Dissertation/Anonymisation/Generalisation - Working/adultgeneralisedata.csv",row.names = FALSE)
