# Getting and Cleaning Data Course Project

This repository contains the source code, code book, and README for the "Peer-graded Assignment: Getting and Cleaning Data Course Project."

## Dataset description

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 

Here are the data for the project:
 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Download the compressed file and unzip it to the working directory.

## Script description

The script is named `run_analysis.R`. After running, it outputs two files: `uci_har_dataset_tidy_data.txt` and `uci_har_dataset_averages.txt`.

- `uci_har_dataset_tidy_data.txt`: Merged and tidy datasetMerges the training and the test sets, and organizes them into a tidy data set.
- `uci_har_dataset_averages.txt`:  independent tidy data set with the average of each variable for each activity and each subject

## Organization steps:

1. Merge the training and test sets to create one combined dataset.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to label the activities in the dataset.
4. Appropriately label the dataset with descriptive variable names.
5. From the dataset in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. 

These steps ensure that the final dataset is well-organized and ready for further analysis.