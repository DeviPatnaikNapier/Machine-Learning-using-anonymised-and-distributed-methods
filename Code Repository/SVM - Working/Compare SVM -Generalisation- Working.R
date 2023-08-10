library(sdcMicro)
library(dplyr)
library(ggplot2)
library(tidyverse )
library(e1071)

accuracy=NULL
for (i in 1:100){ 
  #assign 80% of the data to the training set
  iris[, "train"] <- ifelse(runif(nrow(iris)) < 0.8, 1, 0)
  trainColNum <- grep("train", names(iris))
  trainset <- iris[iris$train == 1, -trainColNum]
  testset <- iris[iris$train == 0, -trainColNum]
  #build model using training data
  svm_model <- svm(Species~ ., data = trainset, 
                   type = "C-classification", kernel = "linear")
  #calculate accuracy on test data
  pred_test <- predict(svm_model, testset)
  accuracy[i] <- mean(pred_test == testset$Species)
}
mean(accuracy)

sd(accuracy)


#write.csv(iris,"C:/Resources/Dissertation/Anonymisation/IrisData.csv",row.names = FALSE)

testdata <- read.csv("C:/Resources/Dissertation/Anonymisation/IrisTestDataSwapped.csv")

accuracy=NULL
for (i in 1:100){ 
  #assign 80% of the data to the training set
  iris[, "train"] <- ifelse(runif(nrow(iris)) < 0.8, 1, 0)
  trainColNum <- grep("train", names(iris))
  trainset <- iris[iris$train == 1, -trainColNum]
  #testset <- iris[iris$train == 0, -trainColNum]
  testset <- testdata
  #build model using training data
  svm_model <- svm(Species~ ., data = trainset, 
                   type = "C-classification", kernel = "linear")
  #calculate accuracy on test data
  pred_test <- predict(svm_model, testset)
  accuracy[i] <- mean(pred_test == testset$Species)
}
mean(accuracy)
sd(accuracy)