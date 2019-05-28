##Data Analysis##

To perform analysis:

1. Clone this repository to a local machine
2. Set working directory to where respoitory is cloned
3. Run 'script.R'

Running the script will download, unzip and read the following:

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

Then the script will:

1. Merge dataset
2. Subset data to focus on mean and standard deviation measurements
3. Rename activity to descriptive value
4. Give distinctive column names
5. Export tidy data set named 'tidy_dataset_with_average_values.txt'

Note: If unzipping does not occuring via script, unzip manually and put files in
working directory/data.  Leave unzipped file structure in tact.
