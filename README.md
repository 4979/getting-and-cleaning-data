# Coursera - Getting and Cleaning Data
> by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

## Course Project

**Coursera Online Course: Getting and Cleaning Data** - Peer Assessments

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

**Descriptions of Project Work**

This "README.md" file describes how "run_analysis.R" script works to analyse the data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Instructions

**Step:01**

  unzip the data from given URL "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and rename the folder with "data".

**Step:02**

  created one R script called ```run_analysis.R``` that does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

_Note_: Make sure the folder "data" and the run_analysis.R script are both in the current working directory.

**Step:03**
- Now, use ```source("run_analysis.R")``` command in RStudio from Console.
- After this, we will find two output files are generated in the current working directory:
  - merged_data.txt **(7.9 Mb)**: it contains a data frame called cleanedData with 10299*68 dimension.
  - data_with_means.txt **(220 Kb)**: it contains a data frame called result with 180*68 dimension.
- Finally, use ```data <- read.table("data_with_means.txt")``` command in RStudio to read the file.
- Since, we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.

> Copyright © Prabhat Kumar, All Rights reserved.
