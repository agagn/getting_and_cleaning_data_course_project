# Getting and Cleaning Data Course Project Code Book

## Data set

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

## R script

The attached R script (run_analysis.R) performs the following to clean up the data:  

### Step 1 

Merges the training and test sets to create one dataset, namely combining `train/X_train.txt` with `test/X_test.txt`, resulting in a 10299x561 data frame.

### Step 2
Read in `features.txt`, extract the row indices containing "mean" and "standard", and extract the corresponding columns. Convert the relevant rows of `features` to lowercase and retain only English letters, then set them as the column names of the dataset. 

The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).  

### Step 3

Read in `train/y_train.txt` and `test/y_train.txt`, merge them into one column named `activity`.

Reads `activity_labels.txt`, and applies descriptive activity names to name the activities in the data set:  

        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING


### step 4

Read in `train/subject_train.txt` and `test/subject_test.txt`, merge them into one column named "group", and add it to the dataset.

The result is saved as `uci_har_dataset_tidy_data.txt`, a `10299x68` data frame. Contains the following columns:

```R
> names(df)
 [1] "subject"                  "activity"                 "tbodyaccmeanx"           
 [4] "tbodyaccmeany"            "tbodyaccmeanz"            "tbodyaccstdx"            
 [7] "tbodyaccstdy"             "tbodyaccstdz"             "tgravityaccmeanx"        
[10] "tgravityaccmeany"         "tgravityaccmeanz"         "tgravityaccstdx"         
[13] "tgravityaccstdy"          "tgravityaccstdz"          "tbodyaccjerkmeanx"       
[16] "tbodyaccjerkmeany"        "tbodyaccjerkmeanz"        "tbodyaccjerkstdx"        
[19] "tbodyaccjerkstdy"         "tbodyaccjerkstdz"         "tbodygyromeanx"          
[22] "tbodygyromeany"           "tbodygyromeanz"           "tbodygyrostdx"           
[25] "tbodygyrostdy"            "tbodygyrostdz"            "tbodygyrojerkmeanx"      
[28] "tbodygyrojerkmeany"       "tbodygyrojerkmeanz"       "tbodygyrojerkstdx"       
[31] "tbodygyrojerkstdy"        "tbodygyrojerkstdz"        "tbodyaccmagmean"         
[34] "tbodyaccmagstd"           "tgravityaccmagmean"       "tgravityaccmagstd"       
[37] "tbodyaccjerkmagmean"      "tbodyaccjerkmagstd"       "tbodygyromagmean"        
[40] "tbodygyromagstd"          "tbodygyrojerkmagmean"     "tbodygyrojerkmagstd"     
[43] "fbodyaccmeanx"            "fbodyaccmeany"            "fbodyaccmeanz"           
[46] "fbodyaccstdx"             "fbodyaccstdy"             "fbodyaccstdz"            
[49] "fbodyaccjerkmeanx"        "fbodyaccjerkmeany"        "fbodyaccjerkmeanz"       
[52] "fbodyaccjerkstdx"         "fbodyaccjerkstdy"         "fbodyaccjerkstdz"        
[55] "fbodygyromeanx"           "fbodygyromeany"           "fbodygyromeanz"          
[58] "fbodygyrostdx"            "fbodygyrostdy"            "fbodygyrostdz"           
[61] "fbodyaccmagmean"          "fbodyaccmagstd"           "fbodybodyaccjerkmagmean" 
[64] "fbodybodyaccjerkmagstd"   "fbodybodygyromagmean"     "fbodybodygyromagstd"     
[67] "fbodybodygyrojerkmagmean" "fbodybodygyrojerkmagstd" 
```
### Step 5

Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as `uci_har_dataset_averages.txt`, a `180x68` data frame, where as before, the first column contains subject IDs, the second column contains activity names (see below), and then the averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.  