#   CODE BOOK
#### _Getting and Cleaning Data Course Project_


### Original Data Set  
******
The original dataset include the following files:   

* __'features_info.txt'__: Shows information about the variables used on the feature vector.
* __'features.txt'__: List of all features.
* __'activity_labels.txt'__: Links the class labels with their activity name.
* __'train/X_train.txt'__: Training set.
* __'train/y_train.txt'__: Training labels.
* __'test/X_test.txt'__: Test set.
* __'test/y_test.txt'__: Test labels.
* __'train/subject_train.txt'__: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* __'train/Inertial Signals/total_acc_x_train.txt'__: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
* __'train/Inertial Signals/body_acc_x_train.txt'__: The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* __'train/Inertial Signals/body_gyro_x_train.txt'__: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.   

### Used Variables
******

| Step          | Variables       | Descriptions                               
| ------------- | -------------   | -------------                              
| Initial Step  | .               | . 
|               | subject_train   | Read data from "./train/subject_train.txt" 
|               | X_train         | Read data from "./train/X_train.txt"       
|               | y_train         | Read data from "./train/y_train.txt"       
|               | subject_test    | Read data from "./train/subject_test.txt"  
|               | X_test          | Read data from "./train/X_test.txt"        
|               | y_test          | Read data from "./train/y_test.txt"        
|               | features        | Read data from "./features.txt"           
|               | activity_labels | Read data from "./train/X_train.txt"       
| Requirement 1 | .               | .       
|               | subject_dataset | Merged from subject_train & subject_test  
|               | X_dataset       | Merged from X_train & X_test        
|               | y_dataset       | Merged from y_train & y_test        
| Requirement 2 | .               | .      
|               | columns_index   | index for 'mean' & 'std' columns  
|               | selected_data   | extracted dataset with only 'mean' & 'std' mearsurements        
| Requirement 3 | _no new variable_ | .      
| Requirement 4 | _no new variable_ | .      
| Requirement 5 | .               | .      
|               | tidy_dataset    | Store the final result  


### Transformations
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

### Output
******
Final out put of the program is a tidy data set with the average of each variable for each activity and each subject. The tidy data set include:

* 180 rows coresponding to the combination of __subjects__ and __activity names__. any set of __(subject, activity name)__  is unique in this tidy data set as it is the result of 'mean' aggregation.
* 563 columns which are combined of:
    + 561 columns of features
    + 2 columns of aggregation dimensions: __subjects and activity names__

### References
******
Other references are listed below:

* run_analysis.R source code
* README.md file
