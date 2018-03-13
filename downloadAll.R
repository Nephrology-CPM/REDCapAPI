# This R script will download all the data for any project held on
# UTHSCSA's REDCap server. A valid project specific API token is required.
# Author: Daniel Montemayor, UTHSCSA 2018

# will check if package is already installed
pkgTest <- function(x)
  {
    if (!require(x,character.only = TRUE))
    {
      install.packages(x,dep=TRUE)
        if(!require(x,character.only = TRUE)) stop("Package not found")
    }
  }

#install required packages if necessary
pkgTest("RCurl")
pkgTest("jsonlite")

# Load packages
library(RCurl)
library(jsonlite)

# Overview message
message( "This script requires a valid REDCap API token. ",
"The script will loop endlessly until a valid token is provided. ",
"This script will create a data/ directory in the current working directory "
"if none exists and save the downloaded data there as a comma separated file. ",
"This script will not re-download if a previously downloaded file is detected.",
"The data is saved as rawData.csv. ")

# readToken asks user for API token
readToken <- function(){
  REDCapToken <- readline(prompt="Enter your REDCap API token: ")
  if(!grepl("^[a-zA-Z0-9]+$",REDCapToken)){
    return(readToken())
  }
  return(REDCapToken)
}

# downloadData trys to fetch and save the raw data as a csv file
downloadData <- function()
{
    # ask for REDCAP Token
    token <- readToken()
    # download raw data in JSON and save file
    tryCatch(
        {
            write.csv(
                fromJSON(
                    postForm(
                        uri='https://redcap.uthscsa.edu/REDCap/api/',
                        token=token,
                        content='record',
                        format='json',
                        type='flat'
                    )
                ),
                file="data/rawData.csv")
        },
        error = function(e){
            # loop until a valid Token is provided
            downloadData()
        }
    )
}

# make sure data directory exists
if(!file.exists("data")){dir.create("data")}

# check for previously downloaded data
if(!file.exists("data/rawData.csv")){downloadData()}
