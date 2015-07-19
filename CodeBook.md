## Getting and Cleaning Data
### Johns Hopkins University - Data Science Specialization.
### CodeBook for Course Project

> Author: Prabhat Kumar

This **markdown** file describes the data, the variables, and any transformations or work, that I have performed to clean up the data.

- The data was obtained from,
  
  URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
  DATA URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
- After, obtaining the data, I have unzipped it and rename the folder with "data".
- **run_analysis.R** script was created to do all analysis work related to the course project.
- The ```run_analysis.R``` script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in *trainData*, *trainLabel* and *trainSubject* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in *testData*, *testLabel* and *testsubject* variables respectively.  
 3. Concatenate *testData* to *trainData* to generate a 10299x561 data frame, *joinData*; concatenate *testLabel* to *trainLabel* to generate a 10299x1 data frame, *joinLabel*; concatenate *testSubject* to *trainSubject* to generate a 10299x1 data frame, *joinSubject*.  
 4. Read the features.txt file from the "/data" folder and store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of *joinData* with the 66 corresponding columns.  
 5. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.   
 6. Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called *activity*.  
 7. Clean the activity names in the second column of *activity*. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.  
 8. Transform the values of *joinLabel* according to the *activity* data frame.  
 9. Combine the *joinSubject*, *joinLabel* and *joinData* by column to get a new cleaned 10299x68 data frame, *cleanedData*. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  
 10. Write the *cleanedData* out to ```"merged_data.txt"``` file in current working directory.  
 11. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the *result* data frame and performing the two for-loops, we get a 180x68 data frame.
 12. Write the *result* out to ```"data_with_means.txt"``` file in current working directory.
 
- To Test:
  
    ```data <- read.table("./data_with_means.txt")```
  
    ```data[1:12, 1:3]```

- Result:
```
subject          activity tBodyAccMeanX
1        1           walking     0.2773308
2        1   walkingUpstairs     0.2554617
3        1 walkingDownstairs     0.2891883
4        1           sitting     0.2612376
5        1          standing     0.2789176
6        1            laying     0.2215982
7        2           walking     0.2764266
8        2   walkingUpstairs     0.2471648
9        2 walkingDownstairs     0.2776153
10       2           sitting     0.2770874
11       2          standing     0.2779115
12       2            laying     0.2813734
```

> Copyright © Prabhat Kumar, All Rights reserved.
