# Getting and Cleaning Data
# Johns Hopkins University - Data Science Specialization.
# Course-Project: (40% of final grade)
# =======================================================
# @author		: Prabhat Kumar
# @date 		: 11-July-2015
#========================================================

## Note: To Set Working Directory.
setwd("~/Desktop/Getting-and-Cleaning-Data/Course-Project")

## Source of data for this project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#========================================================
# Instructions
#========================================================

# Step-01 : Merges the training and the test sets to create one data set.
# Step-02 : Extracts only the measurements on the mean and standard deviation for each measurement.
# Step-03 : Uses descriptive activity names to name the activities in the data set.
# Step-04 : Appropriately labels the data set with descriptive variable names.
# Step-05 : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#========================================================
# Analysis of Data
#========================================================

# Step1. Merges the training and the test sets to create one data set.

trainData <- read.table("./data/train/X_train.txt")
dim(trainData) # 7352*561
head(trainData)
trainLabel <- read.table("./data/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./data/train/subject_train.txt")
testData <- read.table("./data/test/X_test.txt")
dim(testData) # 2947*561
testLabel <- read.table("./data/test/y_test.txt")
table(testLabel)
testSubject <- read.table("./data/test/subject_test.txt")
joinData <- rbind(trainData, testData)
dim(joinData) # 10299*561
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) # 10299*1
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) # 10299*1

# Step2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./data/features.txt")
dim(features)  # 561*2
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices) # 66
joinData <- joinData[, meanStdIndices]
dim(joinData) # 10299*66
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalize M
names(joinData) <- gsub("std", "Std", names(joinData)) # capitalize S
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in column names

# Step3. Uses descriptive activity names to name the activities in the data set.

activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

# Step4. Appropriately labels the data set with descriptive activity names.

names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanedData) # 10299*68
# write out the 1st dataset.
write.table(cleanedData, "merged_data.txt")

# Step5. Creates a second, independent tidy data set with the average of each variable,
#        for each activity and each subject.

subjectLen <- length(table(joinSubject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
# write out the 2nd dataset.
write.table(result, "data_with_means.txt")

# ===========================================
# data <- read.table("./data_with_means.txt")
# data[1:12, 1:3]
# ===========================================
