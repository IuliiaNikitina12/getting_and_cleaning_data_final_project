
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
x_train <- read.table("data/UCI HAR Dataset/test/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/test/y_train.txt")
subject_train <- read.table("data/UCI HAR Dataset/test/subject_train.txt")