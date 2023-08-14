##load the package class
library(class)

##load data
df <- read.csv("C:/Resources/Dissertation/Anonymisation/Knn - Working/adultdataknn.csv")
# Select the relevant columns for the analysis
cols <- c("Age", "Education.Number.of.Years", "Hours.per.week", "income")

# Subset the data. Select the relevant columns for the analysis
adult_subset <- df[, cols]
df_target_category <- df[,15]
##extract generalised testing set
df_test <- read.csv("C:/Resources/Dissertation/Anonymisation/Knn - Working/adultgeneralisedataknn.csv") 
cols_test <- c("Age", "Education.Number.of.Years", "Hours.per.week")
head(df_test)
# Subset the data
adult_subset_test <- df_test[, cols_test]
## see the structure
head(adult_subset_test) 
df_test_category<- df_test[,15]
##run knn function

predicted_income <- knn(adult_subset[, -4],adult_subset_test,cl=df_target_category,k=15)

# Print the predicted class
#cat("Predicted income:", pr, "\n")

##create confusion matrix

tab <- table(predicted_income,df_test_category)
##Calculate Accuracy

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)
