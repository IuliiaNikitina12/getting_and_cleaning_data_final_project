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
