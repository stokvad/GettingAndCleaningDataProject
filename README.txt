How to use the files in this folder

# The RESULT
The tidy dataset is in the file tidyData.txt, and this can easily be importet to R using read.table("tidyData.txt").

# The Code Book
The study, the data, files and variables are described in detail here.
See codebook.md.

--------------------
Data transformations
--------------------

This can all be done with the script "cleanupdata.R" by executing the function "cleanupData()" or by simply running the script in 'run_analysis.R'. Read on to get a grasp on what it does:

# merging datasets
Both the x_train.txt and the x_test.txt was read with the column names given in "features.txt".
For both the activity from y_train.txt and x_test.txt was added, as was the subject from subject_train.txt/subject_test.txt.

# Trimming the data 
The dataset was then trimmed with the grep function, so only the std and mean names columns was left together with the activity and subject

# Activity Names
The activity names was then merged to the dataset by activityId to get each activity named as text, not by number.

# Tidying the data
before exporting the dataset, it was group with the dplyr function group_by and summarised in a table with the mean for each variable.
It was grouped by subject and activity.

# Result
The resulting dataset can be found in tidyData.txt.


------------------
The scripts
------------------


# Downloading the raw files:
source('getrawdata.R') in R to download the files.
This is not necessary though. A copy of the raw files are already in the subfolder 'raw data'.

# To tidy the data (again)
Run the script 'run_analysis.R'. This script prepares a tidy dataset and exports it by using the functions in:

   source('cleanupdata.R') 

The script is thorougly documentet in the code, and gives you the possibility to do other calculations on the source data by changing the last function 'exportTidyDataset'.
