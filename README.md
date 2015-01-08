#   READ ME
#### _Getting and Cleaning Data Course Project_


### Case Study Overview  
******
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced data mining algorithms to attract new users.

**Getting and Cleaning Data** is one of the most important steps of **Data Mining Process**. The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to develop run_analysis.R script that prepare tidy data set ready for later analysis. 

This Case Study data collected from the accelerometers from the Samsung Galaxy S smartphone. 

* A full description of the data is available at [http://archive.ics.uci.edu](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* The data for the project can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### "run_analysis.R" Program Requirements
******
A tidy data set that will need to be prepared with following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### "run_analysis.R" Program Descriptions
******

#### Used Library 

* Use `data.table` package

#### Initial Step

* Using `read.table()` function to read all __train__ data set and __test__ data set
* This initial step also read __features.txt__ and __activity_labels.txt__ preparing for further development

#### Requirement 1 - _Merges the training and the test sets to create one data set._

* Using `rbind()` function to merge the train sets(__subject_train__, __X_train__, __y_train__) and test sets (__subject_test__, __X_test__, __y_test__) into a unique data set including:   
    + __subject_dataset__: Storing subject dimension of the data set   
    + __X_dataset__: Storing set of variables of the data set   
    + __y_dataset__: Storing the labels of actvities   
* Using `remove()` function to release un-used objects for better performance (_optional task_)   

#### Requirement 2 - _Extracts only the measurements on the mean and standard deviation for each measurement._

* Using `grepl()` function to return the index of columns that having __'mean'__ and __'std'__ phase in the __features__ name; Remember to ignore __'meanFreq'__ columns.
* Extract the needed columns by using the above index   

#### Requirement 3 - _Uses descriptive activity names to name the activities in the data set._   

* __y_dataset__ contain activity labels corresponding to each row of the data set
* Using activity labels in __y_dataset__ to look up for activity names in __activity_labels__ object   

#### Requirement 4 - _Appropriately labels the data set with descriptive variable names._   

* Name each factor in __subject_dataset__, __X_dataset__ and __y_dataset__ with the descriptive labels.

#### Requirement 5 - _From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject._   

* Using `aggregate()` function with attibute `FUN="mean"` Aggregation to the data set in the summary level of each __activity_name__ and each __subject__
* Result of above aggregation is the needed __tidy data set__
* Using `write.table()` function to write down the __tidy data set__ into txt file.


### References
******
Other references are listed below:

* run_analysis.R source code
* Codebook.md file

