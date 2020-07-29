---
title: "CodeBook"
author: "Iuliia Nikitina"
date: "29 07 2020"
output: html_document
---


This code book describes the variables, the data, and any transformations or work that i performed to clean up the data.

******

I have created run_analysis.R file to prepare tidy data that can be used for later analysis.
There are some steps i have done with initial messy data.

1. Download zip file from the web: 
```{r}
download.file(fileUrl, "./data/dataset.zip")
```
where fileUrl is url for zip file from the assignment.

2. Unzip this file and put it in the data folder:
```{r}
unzip("./data/dataset.zip", exdir = "data")
```

3. Create `x_test`, `y_test`, `subject_test`, `x_train`, `y_train`, `subject_train` variables:
 + `x_test` <- data from test/X-test.txt file. (2947 rows, 561 columns)
 + `y_test` <- data from test/y-test.txt file. (2947 rows, 1 column)
 + `subject_test` <- data from test/subject_test.txt file. (2947 rows, 1 column)
 + `x_train` <- data from train/X-train.txt file. (7352 rows, 561 columns)
 + `y_train` <- data from train/y-train.txt file. (7352 rows, 1 column)
 + `subject_train` <- data from trainsubject_train.txt file. (7352 rows, 1 column)

4. Create `features`, `activity` variables:
 + `features` <- data from features.txt file that contains names of all of features for our data. (561rows, 2 columns)
 + `activity` <- data from activity_labels.txt that contains names of all activities. (6 rows, 2 columns) 

5. Create `x`, `y`, `subject` variables, that merge the training and the test sets:
 + `x` <- merge `x_train` and `x_test`. (10299 rows, 561 columns)
 + `y` <- merge `y_train` and `y_test`. (10299 rows, 1 column)
 + `subject` <- merge `subject_train` and `subject_test`. (10299 rows, 1 column)

6. Set names of the features as column' names in `x`:
```{r}
features <- features[, 2]
colnames(x) <- features
```

7. Create service variable `x1`:
 + `x1` <- data set that contains only the measurements on the mean and standard deviation for each measurement. (10299 rows, 86 columns)

8. Rename the activities (`y`) in the data set as descriptive names:
```{r}
 for(i in 1:nrow(y)){
  if(y[i, 1] == 1) {
    y[i, 1] <- activity[1, 2]
  }
  if(y[i, 1] == 2) {
    y[i, 1] <- activity[2, 2]
  }
  if(y[i, 1] == 3) {
    y[i, 1] <- activity[3, 2]
  }
  if(y[i, 1] == 4) {
    y[i, 1] <- activity[4, 2]
  }
  if(y[i, 1] == 5) {
    y[i, 1] <- activity[5, 2]
  }
  if(y[i, 1] == 6) {
    y[i, 1] <- activity[6, 2]
  }
 }
```

9. Create `x_set` variable:
 + `x_set` <- Merge `y`,  `x` and `subject` sets. (10299 rows, 88 columns)

10. Label the `x_set` data set with descriptive variable names:
```{r}
colnames(x_set)[1] <- "Subject"
colnames(x_set)[2] <- "Activity"
```

12. Create a data set with the average of each variable for each activity and each subject:
 + `ind_data` <- melt data set `x_set` to "Subject" and "Activity". (885714 rows, 4 columns)
 + `avr_for_each_variable_data` <- data set with average of each activity and aech subject. (180 rows, 88 columns)

13. Write final data to .txt file:
 + `avr_for_each_variable_data` write into data/final_dataset.txt file
 
14. Disription of column' names in final dataset:
 + Subjest - Person id
 + Activity - Activities, that person performed
 + tBodyAcc-mean()-X - time body acceleration signal mean value for x
 + tBodyAcc-mean()-Y - time body acceleration signal mean value for y
 + tBodyAcc-mean()-Z - time body acceleration signal mean value for z
 + tBodyAcc-std()-X - time body acceleration signal standard deviation for x
 + tBodyAcc-std()-Y - time body acceleration signal standard deviation for y
 + tBodyAcc-std()-Z - time body acceleration signal standard deviation for z
 + tGravityAcc-mean()-X - time gravity acceleration signal mean value for x
 + tGravityAcc-mean()-Y - time gravity acceleration signal mean value for y
 + tGravityAcc-mean()-Z - time gravity acceleration signal mean value for z
 + tGravityAcc-std()-X - time gravity acceleration signal standard deviation for x
 + tGravityAcc-std()-Y - time gravity acceleration signal standard deviation for y
 + tGravityAcc-std()-Z - time gravity acceleration signal standard deviation for z
 + tBodyAccJerk-mean()-X - time body acceleration jerk signal mean value for x
 + tBodyAccJerk-mean()-Y - time body acceleration jerk signal mean value for y
 + tBodyAccJerk-mean()-Z - time body acceleration jerk signal mean value for z
 + tBodyAccJerk-std()-X - time body acceleration jerk signal standard deviation for x
 + tBodyAccJerk-std()-Y - time body acceleration jerk signal standard deviation for y
 + tBodyAccJerk-std()-Z - time body acceleration jerk signal standard deviation for z
 + tBodyGyro-mean()-X - time body gyroscope mean value for x
 + tBodyGyro-mean()-Y - time body gyroscope mean value for y
 + tBodyGyro-mean()-Z - time body gyroscope mean value for z
 + tBodyGyro-std()-X - time body gyroscope standard deviation for x
 + tBodyGyro-std()-Y - time body gyroscope standard deviation for y
 + tBodyGyro-std()-Z - time body gyroscope standard deviation for z
 + tBodyGyroJerk-mean()-X - time body gyroscope jerk mean value for x
 + tBodyGyroJerk-mean()-Y - time body gyroscope jerk mean value for y
 + tBodyGyroJerk-mean()-Z - time body gyroscope jerk mean value for z
 + tBodyGyroJerk-std()-X - time body gyroscope jerk standard deviation for x
 + tBodyGyroJerk-std()-Y - time body gyroscope jerk standard deviation for y
 + tBodyGyroJerk-std()-Z - time body gyroscope jerk standard deviation for z
 + tBodyAccMag-mean() - time body acceleration magnitude mean value
 + tBodyAccMag-std() - time body acceleration magnitude standard deviation
 + tGravityAccMag-mean() - time gravity acceleration magnitude mean value
 + tGravityAccMag-std() - time gravity acceleration magnitude standard deviation
 + tBodyAccJerkMag-mean() - time body acceleration jerk magnitude mean value
 + tBodyAccJerkMag-std() - time body acceleration jerk magnitude standard deviation
 + tBodyGyroMag-mean() - time body gyroscope magnitude mean value
 + tBodyGyroMag-std() - time body gyroscope magnitude standard deviation
 + tBodyGyroJerkMag-mean() - time body gyroscope jerk magnitude mean value
 + tBodyGyroJerkMag-std() - time body gyroscope jerk magnitude standard deviation
 + fBodyAcc-mean()-X - frequency body acceleration signal mean value for x
 + fBodyAcc-mean()-Y - frequency body acceleration signal mean value for y
 + fBodyAcc-mean()-Z - frequency body acceleration signal mean value for z
 + fBodyAcc-std()-X - frequency body acceleration signal standard deviation for x
 + fBodyAcc-std()-Y - frequency body acceleration signal standard deviation for y
 + fBodyAcc-std()-Z - frequency body acceleration signal standard deviation for z
 + fBodyAcc-meanFreq()-X - frequency body acceleration signal mean frequency value for x
 + fBodyAcc-meanFreq()-Y - frequency body acceleration signal mean frequency value for y
 + fBodyAcc-meanFreq()-Z - frequency body acceleration signal mean frequency value for z
 + fBodyAccJerk-mean()-X - frequency body acceleration jerk signal mean value for x
 + fBodyAccJerk-mean()-Y - frequency body acceleration jerk signal mean value for y
 + fBodyAccJerk-mean()-Z - frequency body acceleration jerk signal mean value for z
 + fBodyAccJerk-std()-X - frequency body acceleration jerk signal standard deviation for x
 + fBodyAccJerk-std()-Y - frequency body acceleration jerk signal standard deviation for y
 + fBodyAccJerk-std()-Z - frequency body acceleration jerk signal standard deviation for z
 + fBodyAccJerk-meanFreq()-X - frequency body acceleration jerk signal mean frequency value for x
 + fBodyAccJerk-meanFreq()-Y - frequency body acceleration jerk signal mean frequency value for y
 + fBodyAccJerk-meanFreq()-Z - frequency body acceleration jerk signal mean frequency value for z
 + fBodyGyro-mean()-X - frequency body gyroscope mean value for x
 + fBodyGyro-mean()-Y - frequency body gyroscope mean value for y
 + fBodyGyro-mean()-Z - frequency body gyroscope mean value for z
 + fBodyGyro-std()-X - frequency body gyroscope standard deviation for x
 + fBodyGyro-std()-Y - frequency body gyroscope standard deviation for y
 + fBodyGyro-std()-Z - frequency body gyroscope standard deviation for z
 + fBodyGyro-meanFreq()-X - frequency body gyroscope mean frequency value for x
 + fBodyGyro-meanFreq()-Y - frequency body gyroscope mean frequency value for y
 + fBodyGyro-meanFreq()-Z - frequency body gyroscope mean frequency value for z
 + fBodyAccMag-mean() - frequency body acceleration magnitude signal mean value
 + fBodyAccMag-std() - frequency body acceleration magnitude standard deviation
 + fBodyAccMag-meanFreq() - frequency body acceleration magnitude mean frequency value
 + fBodyBodyAccJerkMag-mean() - frequency body acceleration jerk magnitude mean value
 + fBodyBodyAccJerkMag-std() - frequency body acceleration jerk magnitude standard deviation
 + fBodyBodyAccJerkMag-meanFreq() - frequency body acceleration jerk magnitude mean frequency value
 + fBodyBodyGyroMag-mean() - frequency body gyrascope magnitude mean value
 + fBodyBodyGyroMag-std() - frequency body gyrascope magnitude standard deviation
 + fBodyBodyGyrokMag-meanFreq() - frequency body gyroscope magnitude mean frequency value
 + fBodyBodyGyroJerkMag-mean() - frequency body gyrascope jerk magnitude mean value
 + fBodyBodyGyroJerkMag-std() - frequency body gyrascope jerk magnitude standard deviation
 + fBodyBodyGyroJerkMag-meanFreq() - frequency body gyroscope jerk magnitude mean frequency value
 + angle(tBodyAccMean,gravity) - angle between time body acceleration signal mean value and gravity mean
 + angle(tBodyAccJerkMean),gravityMean) - angle between time body acceleration jerk signal mean value and gravity mean
 + angle(tBodyGyroMean,gravityMean) - angle between time body gyrascope mean value and gravity mean
 + angle(tBodyGyroJerkMean,gravityMean) - angle between time body gyrascope jerk mean value and gravity mean
 + angle(X,gravityMean) - angle between x and gravity mean
 + angle(Y,gravityMean) - angle between y and gravity mean
 + angle(Z,gravityMean) - angle between z and gravity mean
