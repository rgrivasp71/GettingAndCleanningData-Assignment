# GettingAndCleanningData-Assignment

## Here is the data for this project:
### https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## run_analysis.R does the following:
### 1. Merges the training and the test sets to create one data set.
#Charging test set
x_test<-read.table("/cloud/project/UCI HAR Dataset/test/X_test.txt",sep = "")
y_test<-read.table("/cloud/project/UCI HAR Dataset/test/y_test.txt",sep = "")

#Charging train set
x_train<-read.table("/cloud/project/UCI HAR Dataset/train/X_train.txt",sep = "")
y_train<-read.table("/cloud/project/UCI HAR Dataset/train/y_train.txt",sep = "")

#Charging features and activity labels
features <- read.table("/cloud/project/UCI HAR Dataset/features.txt",sep = "")
activityLabels <- read.table("/cloud/project/UCI HAR Dataset/activity_labels.txt",sep = "")

#rename col names
names(x_train)=features[,2]
names(x_test)=features[,2]

#merging data
xData<- rbind(x_test,x_train)
yData<- rbind(y_test,y_train)
yData<- left_join(yData,activityLabels)

#adding names to yData
colnames(yData)=c("activityID", "activity")

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

#Subsetting mean and standard deviation colums
meanAndStdColumns <-  grep("(*std*)|(*[M|m]ean*)",features[,2])
xDataFiltered <- xData[,meanAndStdColumns]

### 3. Uses descriptive activity names to name the activities in the data set
yData<- left_join(yData,activityLabels)

### 4. Appropriately labels the data set with descriptive variable names.
mergedFilteredData<-data.table(cbind(yData,xDataFiltered))
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Average data grouped by activity id and activity columns
averageData <- mergedFilteredData[,lapply(.SD,mean),by=c("activityID","activity")]
averageData <- averageData[order(activityID)]

#Creating file called "averageData.csv"
write.table(averageData,file="averageData.csv", row.names = FALSE)

