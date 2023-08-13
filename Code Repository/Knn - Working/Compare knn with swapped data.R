##load the package class
library(class)
df <- data(iris) ##load data
head(iris) ## see the studcture

##Generate a random number that is 80% of the total number of rows in Iris dataset.
ran <- sample(1:nrow(iris), 0.8 * nrow(iris)) 
##Read the Swapped data
IrisAnon <- read.csv("C:/Resources/Dissertation/Anonymisation/Knn - Working/IrisTestDataSwapped.csv")
ranAnon <- sample(1:nrow(IrisAnon), 1 * nrow(IrisAnon)) 
##Normalization function
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Run Normalization on first 4 cols of Iris dataset as predictors
iris_norm <- as.data.frame(lapply(iris[,c(1,2,3,4)], nor))
##Run Normalisation on first 4 cols of IrisAnon Swapped data
irisanon_norm <- as.data.frame(lapply(IrisAnon[,c(1,2,3,4)], nor))

summary(iris_norm)

##Create training set
iris_train <- iris_norm[ran,] 
##Create testing set
iris_test <- irisanon_norm[ranAnon,]

##extract 5th column of training dataset to be used as 'cl' argument in knn function.
iris_target_category <- iris[ran,5]
##extract 5th column if test dataset to measure the accuracy
iris_test_category <- IrisAnon[ranAnon,5]


##run knn function
pr <- knn(iris_train,iris_test,cl=iris_target_category,k=5)

##create confusion matrix
tab <- table(pr,iris_test_category)

##Calculate Accuracy

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)