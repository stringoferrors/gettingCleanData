# Coursera Getting and Cleaning Data Assignment

## Assignment Goal

The assignment is to form tidy data that is ready to analyse.

The data has been taken from accelerometers in Samsung Galaxy S smartphones and a full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded from the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The assignment work is captured in one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## File Overview

This document, README_run_analysis.md, describes `run_analysis.R`.

A separate file, run_analysis_code_book.md contains descriptions of the:

* variables
* data
* transformations or work that performed to clean up the data

## run_analysis.R Code Overview: functions, variables and script 

Executing `run_analysis.R` (when loaded (source("run_analysis.R"))) will form a dity data set of the mean data values.
Note: the working directory must be first set to the parent folder containing the "UCI HAR Dataset".

* Read in all relevant data files for train and test.
* Combine datasets
* Select only the measurements on the mean and standard deviation measurements
* Produce the mean of means table
* Write data to .csv file in the parent directory


