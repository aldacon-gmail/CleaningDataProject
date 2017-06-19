library(dplyr)
library(data.table)

# downloading data repository
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              temp)
unzip(temp)

### Intro
# Constants declaration
Subject_txt<-"Subject"
Activity_txt<-"Activity"

# recovering features and activity variable names from the original database
features<-read.csv("UCI HAR Dataset/features.txt", sep="", header = FALSE)
activity_labels<-read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header = FALSE)


### Creating tidy test
# Recovering subject, kind of activity and parameters 
# for each activity in the test set
test<-read.csv("UCI HAR Dataset/test/X_test.txt", sep="")
subject_test<-read.csv("UCI HAR Dataset/test/subject_test.txt", sep="")
activity_test<-read.csv("UCI HAR Dataset/test/y_test.txt", sep="")

# Using more appropriate names for different data.frames
names(subject_test)<-Subject_txt
names(test)<-features[,2]
names(activity_test)<-"id" # To fix column name for the mutate function


# Adding a new column with the name of the activity the user is doing
activity_test<-mutate(activity_test, Activity=activity_labels[id,2])

# Creating the final test data.frame 
test_f<-cbind(subject_test, activity_test[Activity_txt], test)

### Creating tidy train
# Recovering subject, kind of activity and parameters 
# for each activity in the trainning set
train<-read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE)
subject_train<-read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header = FALSE)
activity_train<-read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header = FALSE)

# Using more appropriate names for different data.frames
names(subject_train)<-Subject_txt
names(train)<-features[,2]
names(activity_train)<-"id" # To fix column name for the mutate function

# Adding a new column with the name of the activity the user is doing
activity_train<-mutate(activity_train, Activity=activity_labels[id,2])

# Creating the final train data.frame 
train_f<-cbind(subject_train, activity_train[Activity_txt], train)


# Merging both databases, including labels
database<-rbind(train_f, test_f)


# Selection of features to be included on the tidy table
# Only the mean() and std() features will be selected
features_names<-as.character(features[[2]])
selected_features<-grep(".*mean\\(\\).*|.*std\\(\\).*", features_names, value=TRUE)
selected_features<-c(Subject_txt,Activity_txt,selected_features)

tidy_database<-database[,selected_features]

# Cleaning names of the columns, removing () and - to make them more easy to use
names_temp<-gsub("\\(\\)", "", names(group))
names(tidy_database)<-gsub("\\-", "", names_temp)

# New database with mean by Subject and Activity
datatable<-data.table(tidy_database)
final_data<-datatable[, lapply(.SD,mean), by=list(Subject,Activity), 
                      .SDcols=3:ncol(datatable)]

# Creating the new file with the tidy database of mean by Subject and Activity
write.table(final_data, file="tidy_data.txt", row.names=FALSE)


