### this script cleans the data for the course project in
### Coursera Getting and Cleaning Data.
### 
### Run the cleanupData function to run the script which
### does all the work.
###
### the script is organized in a function per step in the
### programming assignment, except for assignment part 4,
### which I've included in the first step.


## main function goes through all steps in assignment
cleanupData <- function() {
        
        data <- getMergedDataset()
        data <- getTrimmedDataset(data)
        data <- addActivityNamesToDataset(data)
        result <- exportTidyDataset(data, "tidyData.txt")
        
}


## step 1+4 - function to get merged datasets with column names
getMergedDataset <- function() {
        
        # get column names (features)
        featurefilename <- file.path(datapath, "features.txt")
        featureNames <- read.table(featurefilename) # featureNames$V2 contains the labels

        ## get train data
        # load train data to frame (with column names)
        trainfilename <- file.path(datapath, "train", "X_train.txt")
        data <- read.table(trainfilename, col.names = featureNames$V2)

        # load train activity (with column names)
        trainfilename2 <- file.path(datapath, "train", "y_train.txt")
        data2 <- read.table(trainfilename2, col.names = activityNames[1])

        # load train subject (with column names)
        trainfilename3 <- file.path(datapath, "train", "subject_train.txt")
        data3 <- read.table(trainfilename3, col.names = c("subject"))

        # bind these dataframes to one dataset of train-data
        data <- cbind(data, data2, data3)
        
        ## get test data
        # load test data (with column names)
        testfilename <- file.path(datapath, "test", "X_test.txt")
        testdata <- read.table(testfilename, col.names = featureNames$V2)

        # load test activity (with column names)
        testfilename2 <- file.path(datapath, "test", "y_test.txt")
        testdata2 <- read.table(testfilename2, col.names = activityNames[1])

        # load test subject (with column names)
        testfilename3 <- file.path(datapath, "test", "subject_test.txt")
        testdata3 <- read.table(testfilename3, col.names = c("subject"))
        
        # bind these dataframes to one dataset of test-data
        testdata <- cbind(testdata, testdata2, testdata3)
        
        # merge test and training data to one dataset
        data <- rbind(data, testdata)
        
        #return merged dataset
        data
}


## step 2 - function to extract measurements for mean and std
getTrimmedDataset <- function(data = data.frame()) {
        
        # get an integer vector with items that have 'std' 
        # or 'mean' in column name
        selection <- grep("std|mean|activityId|subject", names(data))
        
        # return this selection
        data[,selection]
}

## step 3 - add descriptive names to activities in dataset
addActivityNamesToDataset <- function(data = data.frame()) {
        
        # load activity names to frame
        labelfilename <- file.path(datapath, "activity_labels.txt")
        labels <- read.table(labelfilename, col.names = activityNames)
        
        # add descriptive names to dataset with merge method
        dataWithActivityNames <- merge(data, labels)
        
        # return this
        dataWithActivityNames
}

## step 4 - label the variables
# this is handled in function getMergedDataset


## step 5 - export tidy dataset
exportTidyDataset <- function(data = data.frame(), 
                                 filename = character()) {

        tidyData <- group_by(data, subject, activityLabel) %>% summarise_each(funs(mean))
        write.table(tidyData, filename, row.names = FALSE)
        
}

## environment variables

# path to data folder
datapath <- "./raw data/UCI HAR Dataset"
# vector with activity label names
activityNames <- c("activityId", "activityLabel")
