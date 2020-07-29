---
author: "Iuliia Nikitina"
---
# getting_and_cleaning_data_final_project

The data for the project: UCI HAR Dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

There are 4 files in the repository:

1. run_analysis.R. This file contains all code, that prepare initial messy data step by step to tidy data. The steps:
 + downloading zip file from the assignment
 + reading data from test
 + reading data from train
 + reading data about features
 + reading data about activity
 + Merging the training and the test sets to create one data set
 + setting features these as column' names in x
 + extracting only the measurements on the mean and standard deviation for each measurement
 + naming the activities in the data set to the descriptive activity names
 + merging y and x sets
 + merging subject and x_set
 + labelling the data set with descriptive variable names
 + creating a data set with the average of each variable for each activity and each subject
 + writing final data to .txt file
 
2. CodeBook.md. This is the code book that describes the variables, the data, and any transformations or work that i performed to clean up the data.
3. final_dataset.txt. Text file fith final tidy data that were recieved after execution run_analysis.R script and that are ready for later analysis.
4. README.md. This file explains how all of the scripts work and how they are connected.
