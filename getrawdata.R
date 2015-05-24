if (!dir.exists("raw data")) {
        dir.create("raw data")
}

## download data (again)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./raw data/getdata_projectfiles_dataset.zip", method="curl")

## unzip data to working directory subfolder
unzip("./raw data/getdata_projectfiles_dataset.zip", exdir = "./raw data")