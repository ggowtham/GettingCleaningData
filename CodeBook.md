CodeBook
=====================

The Source for the original data is [1]: you can download the data [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) or go and see the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) associated to this data.


The project requeries the following transformation of the data:

1. The data Training and test are merged together.
2. The merging include also the subject data and the actvity data.
3. The labeling of the resulting data frame according with the MeasureName.
4. Include the activity name not the activityID.
5. subset the data to include only data related to means and SD mesures.
6. the final dataset and the resulting file include the reshape of the data to include the averaging over all observations for each one of the subjects.

The datasets used in this project were:

  - *activity_labels* containing the 6 values: WALKING, WALKING UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
  - *features* with the 561 labels for each mesure.
  - *subject_test* and *subject_train* subjects id.
  - *X_test* and *X_train*
  - *Y_test* and *Y_train*
  
  The Variables included in the final dataset are:
  ActivityName   
  SubjectID    
  tBodyAccMeanX    
  tBodyAccMeanY       
  tBodyAccMeanZ       
  tBodyAccStdX   
  tBodyAccStdY       
  tBodyAccStdZ    
  tGravityAccMeanX  
  tGravityAccMeanY   
  tGravityAccMeanZ   
  tGravityAccStdX   
  tGravityAccStdY   
  tGravityAccStdZ   
  tBodyAccJerkMeanX 
  tBodyAccJerkMeanY    
  tBodyAccJerkMeanZ   
  tBodyAccJerkStdX   
  tBodyAccJerkStdY  
  tBodyAccJerkStdZ   
  tBodyGyroMeanX        
  tBodyGyroMeanY   
  tBodyGyroMeanZ   
  tBodyGyroStdX   
  tBodyGyroStdY   
  tBodyGyroStdZ   
  tBodyGyroJerkMeanX   
  tBodyGyroJerkMeanY   
  tBodyGyroJerkMeanZ   
  tBodyGyroJerkStdX   
  tBodyGyroJerkStdY   
  tBodyGyroJerkStdZ   
  tBodyAccMagMean   
  tBodyAccMagStd   
  tGravityAccMagMean   
  tGravityAccMagStd   
  tBodyAccJerkMagMean   
  tBodyAccJerkMagStd   
  tBodyGyroMagMean   
  tBodyGyroMagStd   
  tBodyGyroJerkMagMean   
  tBodyGyroJerkMagStd   
  fBodyAccMeanX   
  fBodyAccMeanY   
  fBodyAccMeanZ   
  fBodyAccStdX   
  fBodyAccStdY   
  fBodyAccStdZ   
  fBodyAccJerkMeanX   
  fBodyAccJerkMeanY   
  fBodyAccJerkMeanZ   
  fBodyAccJerkStdX   
  fBodyAccJerkStdY   
  fBodyAccJerkStdZ   
  fBodyGyroMeanX   
  fBodyGyroMeanY   
  fBodyGyroMeanZ   
  fBodyGyroStdX   
  fBodyGyroStdY   
  fBodyGyroStdZ   
  fBodyAccMagMean   
  fBodyAccMagStd   
  fBodyBodyAccJerkMagMean   
  fBodyBodyAccJerkMagStd   
  fBodyBodyGyroMagMean   
  fBodyBodyGyroMagStd   
  fBodyBodyGyroJerkMagMean   
  fBodyBodyGyroJerkMagStd



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
