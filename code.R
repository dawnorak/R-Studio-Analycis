# Import the Data
heartData <- read.csv("/heart.csv", stringAsFactors = FALSE)

str(heartData)

# Identify rows without missing data
heartData <- heartData[complete.cases(heartData),]

# Transform classes of 0 and 1 into benign and malignant
heartData$class <- factor(ifelse(heartData$class == 0, "benign", "malignant"))

# Bulding the model and data splicing
trainingSet <- heartData[1:240, 1:13]
testSet <- heartData[241:304, 1:13]

# Splitting the dataset into training and testing Outcomes
trainingOutcomes <- heartData[1:240, 14]
testOutcomes <- heartData[241:304, 14]

# Applying KNN algorithm to trainingSet and trainingOutcomes
library(class)
predictions <- knn(train = trainingSet, c1 = trainingOutcomes, k = 15, test = testSet)

# Display Predictions
predictions

# Model Evaluation
table(testOutcomes, predictions)

# Finding Accuracy
actual_preds <- data.frame(cbind(actuals=testOutcomes, predicted-predictions))
correlation_accuracy <- cor(actual_preds)
head(actual_preds)
