library(dplyr)
library(data.table)
library(data.frame)
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

#calculating mean and standard deviation
meanAndStdColumns <-  grep("(*std*)|(*[M|m]ean*)",features[,2])

xDataFiltered <- xData[,meanAndStdColumns]
mergedFilteredData<-data.table(cbind(yData,xDataFiltered))

averageData <- mergedFilteredData[,lapply(.SD,mean),by=c("activityID","activity")]
averageData <- averageData[order(activityID)]

write.table(averageData,file="averageData.csv", row.names = FALSE)

