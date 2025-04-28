# Getting and Cleaning Data Course Project
# Source of data for this project: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Download the compressed file and unzip it to the working directory.

# Set `nrows <- 1` to read the entire dataset, and set `nrows <- 100` to quickly 
# load data during the development phase.
nrows <- -1

# Merges the training and the test sets to create one data set.

# read data set
train_df <- read.table("UCI HAR DataSet/train/X_train.txt", nrows = nrows)
test_df <- read.table("UCI HAR DataSet/test/X_test.txt", nrows = nrows)
df <- rbind(train_df, test_df)

# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR DataSet/features.txt")
filtered_index <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
df <- df[, filtered_index]

# Appropriately labels the data set with descriptive activity names.
names(df) <- features[filtered_index, 2]
names(df) <- gsub("[()]", "", names(df))
names(df) <- tolower(names(df))

# Uses descriptive activity names to name the activities in the data set.
# read the activities in the data set
df1 <- read.table("UCI HAR DataSet/train/y_train.txt", nrows = nrows)
df2 <- read.table("UCI HAR DataSet/test/y_test.txt", nrows = nrows)
y <- rbind(df1, df2)
# read activity names
activity <- read.table("UCI HAR DataSet/activity_labels.txt")
y[, 1] = activity[y[ , 1], 2]
names(y) <- "activity"
# bind activity column
df <- cbind(y, df)

# read subject data set
df1 <- read.table("UCI HAR DataSet/train/subject_train.txt", nrows = nrows)
df2 <- read.table("UCI HAR DataSet/test/subject_test.txt", nrows = nrows)
subject <- rbind(df1, df2)
names(subject) <- "subject"
df <- cbind(subject, df)

# Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
ave_df <- aggregate(. ~ subject + activity, data = df, FUN = mean, na.rm = TRUE)
# write tidy data
write.table(ave_df, "tidy_data.txt", row.names = FALSE)