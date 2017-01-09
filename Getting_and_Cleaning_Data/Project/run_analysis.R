# Load (or install and load) needed packages 
if (!require("data.table")) {
        install.packages("data.table")
}

if (!require("reshape2")) {
        install.packages("reshape2")
}

library("data.table")
library("reshape2")

# Download dataset

folder <- "data"
filename <- paste0(folder, "/dataset", format(Sys.time(), "_%m%d%Y"), ".zip")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(folder)) {dir.create(folder)}
download.file(fileUrl, destfile = filename)
unzip(filename,exdir = paste0("./",folder))
file.remove(filename)
datafolder <- as.character(list.dirs(paste0("./",folder), recursive=FALSE))
