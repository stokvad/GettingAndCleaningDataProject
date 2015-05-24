How to use the files in this folder

# The RESULT
The tidy dataset is in the file tidyData.txt, and this can easily be importet to R using read.table("tidyData.txt").

# Downloading the raw files:
source('getrawdata.R') in R to download the files.
This is not necessary though. A copy of the raw files are already in the subfolder 'raw data'.

# To tidy the data (again)
source('cleanupdata.R') and run the function 'cleanupData()'.
This will prepare the tidy file again.

The script is thorougly documentet in the code, and gives you the possibility to do other calculations on the source data by changing the last function 'exportTidyDataset'.
