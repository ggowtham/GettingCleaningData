##
#Helper functions for: Read data X and Y, get subjects, get columns names
#subset Columns Names (get just mean and std), a function to get the X data by subject.
##
library(reshape2)
getYdata <- function(path2, type) {
  theFile <- file.path(path2, paste0("y_", type, ".txt"))
  resultX <- read.table(theFile, header=F, col.names=c("ActivityID"))
  resultX
}

getSubjects <- function(path2, type){
  theFile <- file.path(path2, paste0("subject_", type, ".txt"))
  subjects <- read.table(theFile, header=F, col.names=c("SubjectID"))
  subjects
}

getColumNames <- function(){
  colNames <- read.table("features.txt", header=F, as.is=T, col.names=c("MeasureID", "MeasureName"))
  colNames
}

subSetColumnNames <- function(colNamesComplete){
  subCols <- grep(".*mean\\(\\)|.*std\\(\\)", colNamesComplete$MeasureName)
  subCols
}

getXdata <- function(path2, type, colnames){
  thefile <- file.path(path2, paste0("X_", type, ".txt"))
  resultX <- read.table(thefile, header=F, col.names=colnames)
  resultX
}

xDataSubset <- function(dataCX, subColNames){
  xsbst <- dataCX[,subColNames]
  xsbst
}

##
# main data reader function
# just read and prepare the data to be join
##
dataReader <- function(fileName, filePath) {
  data_y <- getYdata(filePath, fileName)
  subject_data <- getSubjects(filePath, fileName)
  data_cols <- getColumNames()
  data_x <- getXdata(filePath, fileName, data_cols$MeasureName)
  subset_data_cols <- subSetColumnNames(data_cols)
  dataOut <- xDataSubset(data_x, subset_data_cols)
  dataOut$ActivityID <- data_y$ActivityID
  dataOut$SubjectID <- subject_data$SubjectID
  dataOut
}


# Merge both train and test data sets
# Also make the column names nicer
mergeLabelData <- function() {
  datam <- rbind(dataReader("test", "test"), dataReader("train", "train"))
  cnames <- colnames(datam)
  cnames <- gsub("\\.+mean\\.+", cnames, replacement="Mean")
  cnames <- gsub("\\.+std\\.+",  cnames, replacement="Std")
  colnames(datam) <- cnames
  
  activities <- read.table("activity_labels.txt", header=F, as.is=T, col.names=c("ActivityID", "ActivityName"))
  activities$ActivityName <- as.factor(activities$ActivityName)
  datal <- merge(datam, activities)
  datal
}

# To generate a tidy data and  the generate a file we will use the library "reshape2"
# to format the data using the "ActivityName" and "SubjectID"
# we follow the recipe "5.19. Converting Data from Wide to Long" of: 
# W. Chang R Graphics Cookbook, O'Reilly Media, Inc. 2013.
# or:http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/
##
genTidyData <- function(merged_data) {
  ids = c("ActivityID", "ActivityName", "SubjectID")
  mesure = setdiff(colnames(merged_data), ids)
  m_data <- melt(merged_data, id=ids, measure.vars=mesure)
  m_data
}

##
# Here we are following the recipe "5.19. Converting Data from Wide to Long" of: 
# W. Chang R Graphics Cookbook, O'Reilly Media, Inc. 2013.
# http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/
##
reshapeTheDataAndAddMean <-function(data){
  c_data <- dcast(data, ActivityName + SubjectID ~ variable, mean)
  c_data
}

# save the tidy data in a file in the local directory
generateTidyDataFile <- function(fileName) {
  print("Notice that the data files should be availale in the current directory with the same directory structure as the downloaded archive.")
  print(paste0("The tidy data willbe stores in a files named:", fileName, " inside the directory"))
  tidyD <- reshapeTheDataAndAddMean(genTidyData(mergeLabelData()))
  write.table(tidyD, fileName)
}

##
# Test function, just run this function and the tidy data file will be generated in the 
# local folder.
##
generateTidyDataFile("tidy.txt")

