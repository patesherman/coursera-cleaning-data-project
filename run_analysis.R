# 1. Merge the training and test sets to create one data set.

#read in data from saved files
activityType<-read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
features<-read.table("./UCI HAR Dataset/features.txt", header=FALSE)

subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
xTrain<-read.table("./UCI HAR Dataset/train/x_train.txt", header=FALSE)
yTrain<-read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
xTest<-read.table("./UCI HAR Dataset/test/x_test.txt", header=FALSE)
yTest<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)

#assign column names for data sets
colnames(activityType) = c("activityId","activity")

colnames(subjectTrain)= "subjectId"
colnames(xTrain) = features[,2]
colnames(yTrain) = "activityId"

colnames(subjectTest) = "subjectId"
colnames(xTest) = features[,2]
colnames(yTest) = "activityId"

#merge train data sets
TrainData<-cbind(yTrain,subjectTrain, xTrain)

#merge test data sets
TestData<-cbind(yTest,subjectTest, xTest)

#merge train and test data sets to create one data set
MergedData<-rbind(TestData, TrainData)

#2 Filter only Standard Deviation and Mean Values from data set

#create vector of column names
colNames<-colnames(MergedData)

#create vector to select sd and mean from column names
colvect<- (grepl("activityId", colNames))|
          (grepl("subjectId",colNames))|
          (grepl("std..", colNames))|
          (grepl("mean..", colNames)) & (!grepl("meanFreq..", colNames))

#select columns with column name vector created in previous step
FinalData<-MergedData[, colvect==TRUE]

#3. Use discriptive acitvity names

#merge Activity Label file and Final Data set to use discriptive activity names
FinalData<-merge(FinalData, activityType, by = 'activityId', all.x=TRUE)


#4 use discriptive variable names

#replace ambiguious abbreviations with discriptive words
names(FinalData)<-gsub("^t", "time", names(FinalData))
names(FinalData)<-gsub("^f", "frequency", names(FinalData))
names(FinalData)<-gsub("Acc", "Accelerometer", names(FinalData))
names(FinalData)<-gsub("Gyro", "Gyroscope", names(FinalData))
names(FinalData)<-gsub("Mag", "Magnitude", names(FinalData))
names(FinalData)<-gsub("BodyBody", "Body", names(FinalData))

#5 Create a new independent tidy data set with the average of each variable for each activity and each subject. 

#create new data set based on parameters in #5

newData<-aggregate(. ~subjectId + activity, FinalData, mean)

#remove activityId column, it is uneccessary now
newData<-select(newData, -(activityId))

#write to file
write.table(newData, './newTidyData.txt', row.names=FALSE)
