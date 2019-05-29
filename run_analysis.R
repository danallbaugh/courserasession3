# Check if dataset is ready. If not download and unzip
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#destination zip
if(!dir.exists("./data")) {dir.create("./data")}
dest <- paste0(getwd(),"/data/","dataweek4.zip")
#download zip file
if (!file.exists("./data/dataweek4.zip")) {download.file(url,dest)}
#unzip file
if(!dir.exists("./data/UCI HAR Dataset")) {unzip(zipfile = dest, exdir = "./data")}

#read features file
library(dplyr)
library(data.table)
library(tidyr)
#reading files
features<-read.table("data/UCI HAR Dataset/features.txt",header = FALSE)
features <- unite_(features, "obs_feat", c("V1", "V2")) #creating unique field names by concating observations with features to prevent future problems
activity_labels<-read.table("data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
#reading training data
features_train<- read.table("data/UCI HAR Dataset/train/X_train.txt",header = FALSE)
activity_train<- read.table("data/UCI HAR Dataset/train/Y_train.txt",header = FALSE)
subjects_train<- read.table("data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)
#reading test data
features_test<- read.table("data/UCI HAR Dataset/test/X_test.txt",header = FALSE)
activity_test<- read.table("data/UCI HAR Dataset/test/Y_test.txt",header=FALSE)
subjects_test<- read.table("data/UCI HAR Dataset/test/subject_test.txt",header=FALSE)

#rename colomuns in train set
names(features_train)<-features$obs_feat
#rename colomuns in test set
names(features_test)<-features$obs_feat
#rename colomun in activitys set in train
names(activity_train)<-"activity"
#rename colomun in activitys set in test
names(activity_test)<-"activity"
#rename colomun in subject set in train
names(subjects_train)<-"subject"
#rename colomun in subject set in test
names(subjects_test)<-"subject"

#combine subject, activities and features
training_data <- cbind(subjects_train, activity_train, features_train)
test_data <- cbind(subjects_test, activity_test, features_test)

#Question 1 Answer variable which answers: 
#Merge the training and test sets to create one data set
#uses 'rbind' to combine training and test data 
all_data <- rbind(training_data, test_data)

#Question 2 Answer variable which answers:
#Exacts only the measurements on the mean and standard deviation for each measurement
#uses 'grep' to subset only column names with 'std' or 'mean' then binds back subject and activity
std_means_only <- all_data[grep("std\\(\\)|mean\\(\\)", names(all_data))]
std_means_only <- cbind(all_data[,1:2], std_means_only)

#Question 3 Answer variable which answers:
#Use descriptive activity names to name the activities in the data set.
#Uses 'mutate' to change the activity from numbers to names based on 
#look up values in activity_labels via 'factor'.
activity_description <- mutate(std_means_only, activity = as.character(
                        factor(activity, levels=activity_labels$V1, 
                                              labels= activity_labels$V2)))

#Question 4 Answer variable which answers:
#Appropriately labels the data set with descriptive variable names.
#Renames column by removing concatenanted numbers introduced earlier and removing '()'
renamed_all_data <- activity_description
colnames(renamed_all_data) <- gsub('^[0-9]+_',"",gsub('\\()',"",colnames(activity_description))) 

#Question 5 Answer variable:
#started with all_data so each column name is unique and then used piping to group and summarize
subject_grouping <- renamed_all_data %>%
                        group_by(subject, activity) %>%
                        summarize_all(mean)


# Write the Tidy Dataset to file
write.table(subject_grouping, 
            file.path(getwd(), "tidy_dataset_with_average_values.txt"), 
            row.names = FALSE)
