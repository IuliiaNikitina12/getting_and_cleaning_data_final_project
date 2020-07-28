
#download zip file from the assignment

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("data")) {
  dir.create("data")
  download.file(fileUrl, "./data/dataset.zip")
  unzip("./data/dataset.zip", exdir = "data")
}

#read data from test
x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

#read data from train
x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")

#read data about features
features <- read.table("data/UCI HAR Dataset/features.txt")

#read data about activity
activity <- read.table("data/UCI HAR Dataset/activity_labels.txt")

#Merges the training and the test sets to create one data set
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#set features these as column' names in x
features <- features[, 2]
colnames(x) <- features

#extracts only the measurements on the mean and standard deviation for each measurement
x1 <- x[, grep("[Mm]ean|[Ss]td", colnames(x), value=TRUE)]

#uses descriptive activity names to name the activities in the data set
# 1. replace numeric values in y set to activity labels
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
# 2. merge y and x sets
x_set <- cbind(y, x1)

#merge subject and x_set
x_set <- cbind(subject, x_set)

#appropriately labels the data set with descriptive variable names
colnames(x_set)[1] <- "Subject"
colnames(x_set)[2] <- "Activity"

#creates a data set with the average of each variable for each activity and each subject
# for doing this we need to install package reshape2
library(reshape2)
ind_data <- melt(x_set, id=c("Subject", "Activity"))
avr_for_each_variable_data <- dcast(ind_data, Subject + Activity ~ variable, mean)

#write final data to .txt file
write.table(avr_for_each_variable_data, "data/final_dataset.txt", row.name=FALSE)