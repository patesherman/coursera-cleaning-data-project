# Code Book for Cleaning Data Coursera Project

## Description
This code book provides further descriptions of variables and method to achieve output of `newTidyData.txt` for the 
final project as part of the Coursera Course "Getting and Cleaning Data".

## Description of Source Data
### Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing 
a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the 
data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational 
and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency 
was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details.

A full description of the experiment is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+SmartphonesData

The data zip file:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Source Files Used in Analysis
* features.txt
* activity_labels.txt
* subject_train.txt
* x_train.txt
* y_train.txt
* subject_test.txt
* x_test.txt
* y_test.txt

## Method
Below is a synopsis of the `run_analysis.R` script created to achieve output `newTidyData.txt`.
1. Merge the training and the test sets to create one data set.
    * Read in data from source files.
    * Assign colunmn names.
    * Create a merged training data set and a test data set.
    * Merge the training and test data set to create one data set.

2. Extract only the measurements on the mean and standard deviation for each measurement.
    * Create a vector of column names to select only std and mean.
    * Select only std and mean. 
      * `mean()`: Mean value 
      * `std()`: Standard deviation 
      
3. Use descriptive activity names to name the activities in the data set.
    * Merge Activity Label file and data set to use discriptive activity names.
  
4. Appropriately labels the data set with descriptive variable names.
    * Use gsub function to replace abbreviated variable names with descriptive names.  
  
5. From the data set in step 4, create a second, independent tidy data set with the average of 
each variable for each activity and each subject.
    * Create a new data set with aggregate function to provide the average of each variable for each activity and each subject.



## Identifiers

 ### Activity Labels
* `WALKING` : subject was walking during the test
* `WALKING_UPSTAIRS` : subject was walking up a stairs during the test
* `WALKING_DOWNSTAIRS` : subject was walking down stairs during the test
* `SITTING` : subject was sitting during the test
* `STANDING` : subject was standing during the test
* `LAYING` : subject was laying down during the test

### Variable Labels
* `subjectId` : Test Subject Id
* `activity` : The type of activity being performed when identified measurement was taken 

#### Measurements
 * timeBodyAccelerometer-mean()-X                
 * timeBodyAccelerometer-mean()-Y
 * timeBodyAccelerometer-mean()-Z
 * timeBodyAccelerometer-std()-X
 * timeBodyAccelerometer-std()-Y
 * timeBodyAccelerometer-std()-Z
 * timeGravityAccelerometer-mean()-X
 * timeGravityAccelerometer-mean()-Y
 * timeGravityAccelerometer-mean()-Z
 * timeGravityAccelerometer-std()-X
 * timeGravityAccelerometer-std()-Y
 * timeGravityAccelerometer-std()-Z
 * timeBodyAccelerometerJerk-mean()-X
 * timeBodyAccelerometerJerk-mean()-Y
 * timeBodyAccelerometerJerk-mean()-Z
 * timeBodyAccelerometerJerk-std()-X            
 * timeBodyAccelerometerJerk-std()-Y
 * timeBodyAccelerometerJerk-std()-Z
 * timeBodyGyroscope-mean()-X
 * timeBodyGyroscope-mean()-Y
 * timeBodyGyroscope-mean()-Z
 * timeBodyGyroscope-std()-X                   
 * timeBodyGyroscope-std()-Y
 * timeBodyGyroscope-std()-Z
 * timeBodyGyroscopeJerk-mean()-X                
 * timeBodyGyroscopeJerk-mean()-Y
 * timeBodyGyroscopeJerk-mean()-Z
 * timeBodyGyroscopeJerk-std()-X                 
 * timeBodyGyroscopeJerk-std()-Y
 * timeBodyGyroscopeJerk-std()-Z
 * timeBodyAccelerometerMagnitude-mean()         
 * timeBodyAccelerometerMagnitude-std()
 * timeGravityAccelerometerMagnitude-mean()
 * timeGravityAccelerometerMagnitude-std()       
 * timeBodyAccelerometerJerkMagnitude-mean()
 * timeBodyAccelerometerJerkMagnitude-std()
 * timeBodyGyroscopeMagnitude-mean()             
 * timeBodyGyroscopeMagnitude-std(
 * timeBodyGyroscopeJerkMagnitude-mean()
 * timeBodyGyroscopeJerkMagnitude-std()          
 * frequencyBodyAccelerometer-mean()-X
 * frequencyBodyAccelerometer-mean()-Y
 * frequencyBodyAccelerometer-mean()-Z           
 * frequencyBodyAccelerometer-std()-X
 * frequencyBodyAccelerometer-std()-Y
 * frequencyBodyAccelerometer-std()-Z            
 * frequencyBodyAccelerometerJerk-mean()-X
 * frequencyBodyAccelerometerJerk-mean()-Y
 * frequencyBodyAccelerometerJerk-mean()-Z       
 * frequencyBodyAccelerometerJerk-std()-X
 * frequencyBodyAccelerometerJerk-std()-Y
 * frequencyBodyAccelerometerJerk-std()-Z       
 * frequencyBodyGyroscope-mean()-X
 * frequencyBodyGyroscope-mean()-Y
 * frequencyBodyGyroscope-mean()-Z            
 * frequencyBodyGyroscope-std()-X
 * frequencyBodyGyroscope-std()-Y               
 * frequencyBodyGyroscope-std()-Z"                
 * frequencyBodyAccelerometerMagnitude-mean()
 * frequencyBodyAccelerometerMagnitude-std()
 * frequencyBodyAccelerometerJerkMagnitude-mean()
 * frequencyBodyAccelerometerJerkMagnitude-std()
 * frequencyBodyGyroscopeMagnitude-mean()
 * frequencyBodyGyroscopeMagnitude-std()         
 * frequencyBodyGyroscopeJerkMagnitude-mean()
 * frequencyBodyGyroscopeJerkMagnitude-std()
