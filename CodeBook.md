Codebook.md
===========

Summary
-------

As part of the task for *Getting and Cleaning Data Course Project*, this document describes the variables, the data, and all transformations and decisions taken to clean up the data from the [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

On this document first I will explain why I changed the order of the instructions, and first I created tidy train and test datasets and then I joined them. Then I will explain the process followed to clean up the data and create the new dataset and finally there will be a section describing all the variables in the dataset.

Changing Order
---------------

On my approximation to the assignment I took one major decission, affecting on the process to clean up the data and creating the final dataset, that it's against the description suggested by the job description. However, it should lead to the same result, and I think that this approximation is more extendable to other features selection and doesn't provide any drawback.

Instead of merging the train and data sets, and then assigning the feature names, and adding new features ("Subject" and "Activity"), I just created a tidy test and train dataset with the appropriate feature names and including those new features, and then I joined them. I think that with this approximation, the feature selection is cleaner, and you can use feature names instead of indexes, to make the selection.


Cleaning Process
----------------

The complete process to clean up the data can be followed on the run_analysis.R script.

However, the main steps followed are:

1. Data download and Unzip
2. Constant declarations and recovering features and activity names from the files
3. Creating tidy test
4. Creating tidy train
5. Merging train and test
6. Features Selection
7. Creating new tidy database with the selected features
8. Removing difficult characters from feature names
9. Creation of the new tidy_database with the average value of each feature by Subject and Activity


Variables
---------

The variables on the tidy final database are:

Subject: ID of the Subject who made the experiment. Integer. 1:30
Activity: Type of the activity performed when the measures where taken. Values: STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

The measured features follow this rule

[t|f][Body|Gravity][Acc|Gyro][|Jerk][|Mag][mean|std][X|Y|Z|]

[t|f]
t: denotes Time
f: denotes Freqüency

[Body|Gravity]
It denotes Body or Gravity acceleration

[Acc|Gyro]
It denotes linear acceleration (Acc) or angular velocity (Gyro)

[|Jerk]
If included, it denotes time derivation

[|Mag]
If included, it denotes magnitude

[mean|std]
It is used to denote if this is the mean or the std of the measure. 

[X|Y|Z|]
It is used to denote 3-axial signals in the X, Y and Z directions. If it is not included the measure has not been split on those directions.

And all features are normalized and bounded within [-1,1]

List of values:

tBodyAccmeanX
tBodyAccmeanY
tBodyAccmeanZ
tBodyAccstdX 
tBodyAccstdY
tBodyAccstdZ
tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ
tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ
tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ
tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ
tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ
tBodyGyrostdX
tBodyGyrostdY
tBodyGyrostdZ
tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ
tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ
tBodyAccMagmean
tBodyAccMagstd
tGravityAccMagmean
tGravityAccMagstd
tBodyAccJerkMagmean
tBodyAccJerkMagstd
tBodyGyroMagmean
tBodyGyroMagstd
tBodyGyroJerkMagmean
tBodyGyroJerkMagstd
fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ
fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ
fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ
fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ
fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ
fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ
fBodyAccMagmean
fBodyAccMagstd
fBodyBodyAccJerkMagmean
fBodyBodyAccJerkMagstd
fBodyBodyGyroMagmean
fBodyBodyGyroMagstd
fBodyBodyGyroJerkMagmean
fBodyBodyGyroJerkMagstd
