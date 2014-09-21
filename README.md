Course Project - Getting & Cleaning Data
================

Course project for the Get Data course part of the Data Science Specialization from  Johns Hopkins University on Coursera

# Intro
This project includes the following:
  
    1 - README.md - this file
    2 - CODEBOOK.md - data dictionary that describes the data in the output 
    dataset as well as data transformations performed
    3 - run_analysis.R - main analysis script (see description below)
    4 - clean_names.R - script to clean variable names (see description below)
    5 - name_change.txt - lists the new names for each variable changed 
    in clean_names.R
	
## Project Requirements
The assignment included the following requirements:

    1 - Merges the training and the test sets to create one data set.
    2 - Extracts only the measurements on the mean and standard deviation for 
    each measurement. 
    3 - Uses descriptive activity names to name the activities in the data set
    4 - Appropriately labels the data set with descriptive variable names. 
    5 - From the data set in step 4, creates a second, independent tidy data 
    set with the average of each variable for each activity and each subject.

## Usage and folder structure
The project requires the use of the following folder structure:

    ./ - (base folder) location of scripts as well as README.md and CODEBOOK.md files
    ./Data - location of data sets and the output_analysis.txt file
    ./Data/test - Test data set
    ./Data/train - Train data set

The names of the files included in the assignment can be left untouched.

The main function is located on the _run_analysis.R_ file, if executed without errors
it will create the _output_analysis.txt_ file and show no errors in the console.

In order to complete the requirements the following scripts are included:

    run_analysis.R : 
    
    Performs the loading of data sets and merging, it also identifies
    the measurements for mean and standard deviation and extracts them,
    creates a record for each measurement by activity and subject and 
    calculates the mean for each observation, finally transforms the 
    measurement labels to a more readable format by calling the script
    clean_names.R. The resulting data set is then written to a file
    called output_analysis.txt
    
    clean_names.R : 
    
    This script uses a for loop with a series of regular expressions to
    clean the names of each measurement label on the data set, it will
    expand abbreviations (acc to acceleration, gyro to gyroscope, etc)
    and will make all labels lowercase.
