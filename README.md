Getting Cleaning Data
=====================

  This Repository contain the file results for the project of the Coursera course: Getting and Cleaning Data
by Jeff Leek, Roger D. Peng and Brian Caffo.

Project Definition.
-------------------
  
  The definition of the Project was:

  The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
  
  The requirements was to submit: 1) a tidy data, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called **CodeBook.md**. You should also include a **README.md** in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
  
  The main file is an R script called **run_analysis.R** that does the following: 
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement. 
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive activity names. 
  - Creates a second, independent tidy data set with the average of each variable for each activity and each     subject. 
  
  The source for the data is [1].
  
run_analysis.R
---------------

  The script is divided in several "helper" functions, some action functions and a main function:
  
helpers:
  - getYdata
  - getSubjects
  - getColumNames
  - subSetColumnNames
  - getXdata
  - xDataSubset
  - reshapeTheDataAndAddMean

actions:
   - dataReader
   - mergeLabelData
   - genTidyData

main:
   - generateTidyDataFile
   
   The helpers as each function name indicate are meant to read the data, get the column names, get the subjects, subset the data and reshape the data and shoe the mean of the tidy data which is the final preparation to save the file. The action functions are meant to use the helpers to read, merge and format the data following the definition of the project. Finally the main function can be call to start the complete process and generate the file.
   
   
   
Note:
-----
   We use the **reshape2** library, to reshape the data and to do the merging of the data using the variables: *ActivityID*, *ActivityName* and *SubjectID*, also to include the maen of the mesures for the different subjects in the final file, we follow the recomendations in the book [2] or follow the site [3]. This technique was applied in the functions: the genTidyData and reshapeTheDataAndAddMean.

References:
----------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2]W. Chang R Graphics Cookbook, O'Reilly Media, Inc. 2013.

[3]http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/