
#download zip file from the assignment

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("data")) {
  dir.create("data")
  download.file(fileUrl, "./data/dataset.zip")
  unzip("./data/dataset.zip", exdir = "data")
}



