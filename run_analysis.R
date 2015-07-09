# Getting and Cleaning Data
# @author : Prabhat Kumar
# @date   : 09-July-2015
# =========================

# Instructions:

# Step-01 : Merges the training and the test sets to create one data set.
# Step-02 : Extracts only the measurements on the mean and standard deviation for each measurement.
# Step-03 : Uses descriptive activity names to name the activities in the data set.
# Step-04 : Appropriately labels the data set with descriptive variable names.
# Step-05 : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Note: To Set the Working Directory,
# setwd("~/Desktop/Coursera/Getting-and-Cleaning-Data/Course-Project/")

# Step-01 : After reading training and test data set,
#           Merges the training and the test sets to create one data set.

trainData <- read.table("./data/train/X_train.txt")
dim(trainData)                                                # 7352*561
head(trainData)
trainLabel <- read.table("./data/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./data/train/subject_train.txt")
testData <- read.table("./data/test/X_test.txt")
dim(testData)                                                 # 2947*561
testLabel <- read.table("./data/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./data/test/subject_test.txt")
joinData <- rbind(trainData, testData)
dim(joinData)                                                 # 10299*561
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel)                                                # 10299*1
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject)                                              # 10299*1
