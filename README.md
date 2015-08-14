---
title: "Getting and Cleaning Data, Course Project"
output: word_document
---

The project data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  A full description can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


**Before running code, download data from the following site, unzip and save to your working directory.**
http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##run_analysis.R code performs the following actions:
* Loads the pertinent data sets into R
* Combines the test data sets and training data sets into one file
* Cleans up the verbiage in column headers, removing punctuation and clarifying abbreviated variable names
* Substitutes in descriptive activity labels
* Subsets for all columns that include pertinent mean and standard deviation measurements
* Calculates the mean of each variable for each activity and each subject
* Writes the newly created independent tidy data set to text file



**References:**
1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
