
# Final Project for Coursera- Getting and Cleaning Data Course
## Overview

This is a final project for the Coursera Course "Getting and Cleaning Data". 
The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. Requirements of the R script for the 
project are listedbelow, along with the data link. The `CodeBook.md` file contains additional information 
regarding variables, and data summaries for this project. The final output is provided in the file `newTidyData.txt`.
Here are the data for the project:

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+SmartphonesData 

The data zip file:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Script

The R script called `run_analysis.R` does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
for each activity and each subject.
