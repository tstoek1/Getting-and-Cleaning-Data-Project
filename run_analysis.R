##Prior to running below code, unzip file provided in project
## directions and save to working directory.

##Load dplyr package
library(dplyr)

##Read the following data sets into R
x_test<-read.table("X_test.txt")
x_train<-read.table("X_train.txt")
y_test<-read.table("y_test.txt")
y_train<-read.table("y_train.txt")
subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")
features<-read.table("features.txt")

##Combine all pertinent test data sets into one file and all 
##training data sets into another file
x_test_sa<-cbind(subject_test, y_test, x_test)
x_train_sa<-cbind(subject_train, y_train, x_train)

##Combine test and training data sets and create header
combinedsets<-rbind(x_test_sa, x_train_sa)
header<-c("Subject", "Activity", as.character(features[,2]))

##Clean up verbiage in header, removing punctuation and
##clarifying abbreviated terms
header<-gsub("-mean\\(\\)", "mean", header)
header<-gsub("-std\\(\\)", "Stdev", header)
header<-gsub("Freq\\(\\)", "Frequency", header)
header<-gsub("-", "", header)
header<-gsub("^t", "Time", header)
header<-gsub("^f", "Frequency", header)
header<-gsub("Acc", "Accelerometer", header) 
header<-gsub("Gyro", "Gyroscope", header) 
header<-gsub("Mag", "Magnitude", header) 
header<-gsub("BodyBody", "Body", header) 
names(combinedsets)<-header

##Substitute in descriptive activity labels
combinedsets$Activity<-gsub("1", "WALKING", combinedsets$Activity)
combinedsets$Activity<-gsub("2", "WALKING_UPSTAIRS", combinedsets$Activity)
combinedsets$Activity<-gsub("3", "WALKING_DOWNSTAIRS", combinedsets$Activity)
combinedsets$Activity<-gsub("4", "SITTING", combinedsets$Activity)
combinedsets$Activity<-gsub("5", "STANDING", combinedsets$Activity)
combinedsets$Activity<-gsub("6", "LAYING", combinedsets$Activity)

##Subsets for all columns that include pertinent mean and
##standard deviation measurements
meanstd<-grep("Subject|Activity|mean|Stdev", names(combinedsets))
meanstd2<-combinedsets[,meanstd]

##Calculates the mean of each variable for each activity and
##each subject
tidyset<-group_by(meanstd2, Subject, Activity)%>%summarise_each(funs(mean))

##Writes newly created tidy data set to text file
write.table(tidyset, file="New_Tidy_Set.txt", sep = " ", row.names=F)


