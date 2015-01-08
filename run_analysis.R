
library(data.table)

#Initial Step - Load raw data 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")

features <- read.table("./UCI HAR Dataset/features.txt", quote="\"")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")


# Requirement 1 - Merges the training and the test sets to create one data set.
subject_dataset <- rbind(subject_train, subject_test)
X_dataset <- rbind(X_train, X_test)
y_dataset <- rbind(y_train, y_test)

## Release un-used objects for better performance
remove(subject_train, subject_test, X_train, X_test, y_train, y_test)


# Requirement 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

## Return the index of columns that having 'mean' and 'std' phase in the feature name; Remember to ignore 'meanFreq' columns.
columns_index <- grepl("std|mean", features[ ,2], fixed=FALSE) & !grepl("meanFreq", features[ ,2], fixed=FALSE)

## Extract the needed columns by using the index
selected_data <- X_dataset[ ,columns_index]


# Requirement 3 - Uses descriptive activity names to name the activities in the data set

## y_dataset contain activity labels corresponding to each row
## Using activity labels in y_dataset to look up for activity names in activity_labels object

y_dataset[ ,2] <- activity_labels[,2][y_dataset[,1]]


# Requirement 4 - Appropriately labels the data set with descriptive variable names.

names(subject_dataset) <- "subject"
names(X_dataset) <- features[ ,2]
names(y_dataset) <- c("activity_label","activity_name")


# Requirement 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Apply 'mean' Aggregation to the data set in the summary level of each activity_name and each subject
tidy_dataset <- aggregate(X_dataset, by = list(subject_dataset$subject,y_dataset$activity_name), FUN = "mean")

## Write tidy_dataset into txt file
write.table(tidy_dataset, "tidydataset.txt", row.name=FALSE)
