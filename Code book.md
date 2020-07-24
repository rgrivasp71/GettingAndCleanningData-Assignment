# Data source
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# run_analysis.R Variables
### Variables used to charge dataset files:
x_test
y_test
x_train
y_train
### Variables used to charge dataset'labels:
features 
activityLabels
### Variables used to merge test and train data sets
xData
yData
### Variable used to subset mean and standard deviation columns
xDataFiltered
### Variable used to merge filtered data
mergedFilteredData
### Variable used to calculate the average grouped by activity
averageData

## DATASET VARIABLES
### Time signals
#### tBodyAcc-XYZ
#### tGravityAcc-XYZ
#### tBodyAccJerk-XYZ
#### tBodyGyro-XYZ
### tBodyGyroJerk-XYZ
#### tBodyAccMag
#### tGravityAccMag
#### tBodyAccJerkMag
#### tBodyGyroMag
#### tBodyGyroJerkMag
### Frequency signals
#### fBodyAcc-XYZ
#### fBodyAccJerk-XYZ
#### fBodyGyro-XYZ
#### fBodyAccMag
#### fBodyAccJerkMag
#### fBodyGyroMag
#### fBodyGyroJerkMag
