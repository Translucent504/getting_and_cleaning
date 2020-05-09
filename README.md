# Getting and Cleaning Data Course Project
Course Project for Getting and Cleaning Data (John Hopkins Data Science)

# How to Load Final Averaged Dataset:
Either download the **averaged_data.csv** file or keep the **run_analysis.R** script in a folder that contains a **raw_data** folder with the UCI dataset. To load the **averaged_data.csv** file simply load the tidyverse and then use:
```{r}
library(tidyverse)
test <- read_csv("averaged_data.csv", col_types = cols(activity="c", .default=col_number()))
```
The loaded test tibble should be 180x68 dimensional.


# Project Requirements and Info:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
- [X] a tidy data set as described below, 
- [X] a link to a Github repository with your script for performing the analysis
- [X] a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should create one R script called run_analysis.R that does the following.

- [X] Merges the training and the test sets to create one data set.
- [X] Extracts only the measurements on the mean and standard deviation for each measurement.
- [X] Uses descriptive activity names to name the activities in the data set
- [X] Appropriately labels the data set with descriptive variable names.
- [X] From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
