##load the package class
library(class)
 
##load data
df <- read.csv("C:/Resources/Dissertation/Anonymisation/Knn - Working/adultdataknn.csv")
## see the structure
head(df) 

##Generate a random number that is 80% of the total number of rows in adult dataset.
ran <- sample(1:nrow(df), 0.8 * nrow(df)) 

##Normalization function
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Run Normalization on 4 numerical cols of df dataset as predictors
df_norm <- as.data.frame(lapply(df[,c(1,3,5,13)], nor))

summary(df_norm)

##Create training set
df_train <- df_norm[ran,] 
##extract testing set
df_test <- df_norm[-ran,] 
##extract 15th column of training dataset to be used as 'cl' argument in knn function.
df_target_category <- df[ran,15]
##extract 15th column if test dataset to measure the accuracy
df_test_category <- df[-ran,15]

##run knn function
pr <- knn(df_train,df_test,cl=df_target_category,k=5)

##create confusion matrix
tab <- table(pr,df_test_category)

##Calculate Accuracy

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)