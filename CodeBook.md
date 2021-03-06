#**Code Book**

---

Codebook explaining the different variables used and  transformations applied in scripts for data cleaning project.

#**Source Data**

---

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#**Dataset Info**

---

*(from the README.txt and features_info.txt in the source data zip file)*

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

##Data Package##

* readme.txt
* features_info.txt: info about the variables used on the feature vector
* features.txt: list of features
* activity_labels.txt: class lables with descriptive names
* X_train.txt: training set
* Y_train.txt training lables
* subject_train.txt: training subjects
* X_test.txt: testing set
* Y_test.txt: testing lables
* subject_test.txt: testing subjects

##Data Manipulation##

1. Used 'read.csv' on all files listed above (Note in doing so I concatenated row line number with feature name as original data source had duplicate values and this create unique names).
2. Row bind the three training data files; row bind the three test data files
3. Column bind the two files created in step 2 to create a single data file
4. Take data file created in step 3 to subset on columns featuring 'std' or 'mean'
5. Mutate labels for activity to change from integers to descriptive labels per the 'activity_labels.txt' file
6. Strip 'Number_' and '()' from column names for more descriptive labels
7. Group by subject and activity then summarize by mean to create tidy data set
8. Export tidy data set to table via 'write.table' and saved as 'tidy_dataset_with_average_values.txt'

##Data Labels##

Subject

* 30 subjects carried out experiment numbered 1:30
        
Activity

* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying


tBodyGyroJerkMag-std

fBodyAcc-mean-X

fBodyAcc-mean-Y

fBodyAcc-mean-Z

fBodyAcc-std-X

fBodyAcc-std-Y

fBodyAcc-std-Z

fBodyAccJerk-mean-X

fBodyAccJerk-mean-Y

fBodyAccJerk-mean-Z

fBodyAccJerk-std-X

fBodyAccJerk-std-Y

fBodyAccJerk-std-Z

fBodyGyro-mean-X

fBodyGyro-mean-Y

fBodyGyro-mean-Z

fBodyGyro-std-X

fBodyGyro-std-Y

fBodyGyro-std-Z

fBodyAccMag-mean

fBodyAccMag-std

fBodyBodyAccJerkMag-mean

fBodyBodyAccJerkMag-std

fBodyBodyGyroMag-mean

fBodyBodyGyroMag-std

fBodyBodyGyroJerkMag-mean

fBodyBodyGyroJerkMag-std
