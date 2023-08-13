# Load required libraries
# For SVM implementation
library(e1071)  
# For data preprocessing
library(caret)  

# Load the dataset
adultdata<- read.csv("C:/Resources/Dissertation/Anonymisation/SVM - Working/adultdatasvm.csv")

# Convert the target variable to a binary factor
adultdata$income <- factor(ifelse(adultdata$income == ">50K", 1, 0))

# Convert categorical variables to factors
categorical_cols <- c("Workclass", "Marital.status", "Occupation", "Relationship", "Race", "Sex", "Native.country")
adultdata[, categorical_cols] <- lapply(adultdata[, categorical_cols], as.factor)

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(adultdata$income, p = 0.8, list = FALSE)
train_data <- adultdata[train_index, ]

test_data <-read.csv("C:/Resources/Dissertation/Anonymisation/SVM - Working/adultdataswappedsvm.csv")
# Convert the target variable to a binary factor
test_data$income <- factor(ifelse(test_data$income == ">50K", 1, 0))
# Train the SVM model
svm_model <- svm(income ~ ., data = train_data, kernel = "radial", cost = 1)

# Predict using the SVM model
predictions <- predict(svm_model, newdata = test_data)

# Confusion matrix
conf_matrix <- confusionMatrix(predictions, test_data$income)
print(conf_matrix)

# Accuracy
accuracy <- conf_matrix$overall['Accuracy']
print(paste("Accuracy:", accuracy))

mean(accuracy)



