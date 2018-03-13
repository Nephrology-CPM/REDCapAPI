# REDCapAPI
Scripts for communication through REDCap API

# How-to-use by script
A short description of each script is provided.
Accompanying each script you will find bulleted instructions for different
use cases. The instructions are independent of each other. Please follow the
bulleted instructions that most closely match your particular use.

## [downloadAll.R](downloadAll.R)
R script will request all of a project's data and save as a .csv file. A valid API token to the REDCap project is required.
+ **Vanilla use with R**

    For use with [standard install of R from the Comprehensive R Archive
    Network (CRAN)](https://cran.r-project.org/).

    Simply launch R
    ```
    $ R
    ```
    and and source the script to execute.
    ```R
    > source("path/to/this/script/downloadAll.R)
    ```

    *Alternatively you can just run the script from the terminal with
    Rscript.*
    ```
    $ Rscript path/to/this/script/downloadAll.R
    ```

+ ** Let Rstudio install requirements**

  For use with a [standard install of Rstudio](https://www.rstudio.com/products/rstudio/download/).

  Launch Rstudio and set working directory to the location of this script.
  ```
  > setwd("path/to/this/script")
  ```

  Locate in the menu bar at the top of the Rstudio Desktop window the
  drop-down menu labeled `Tools` and select `Install Packages`. A small
  window will appear in the Rstudio applicaiton titled 'Install Packages'.
  Leave the default settings in place for the `Install from` and `Install
  to Library` fields. Enter the package names 'RCurl, jasonlite' in the
  `Packages` field. Check the `install dependencies` box and click the
  `Install` button at the bottom of the window.

  Finally, source the script to execute.
  ```R
  > source(downloadAll.R)
  ```
+ ** Conda users - Create an environment to handle requirements**

  For use with a [standard install of anaconda](https://docs.anaconda.com/anaconda/install/).

  You just had to use conda, didn't you! OK, the safest way is to create a virtual environment and install the required packages there. You will run this script under this environment.

  Create a virtual environment with conda.
  Refer to this [usefull guide](https://uoa-eresearch.github.io/eresearch-cookbook/recipe/2014/11/20/conda/) and [this one](https://samrelton.wordpress.com/2015/07/02/rconda/) for more detailed tutorials.
  ```
  $ conda create -n REDCapAPI anaconda  
  ```
  Proceed with adding all the new packages by pressing `y`.
  Now, switch to this new environment.
  ```
  $ source activate REDCapAPI
  ```
  Install R.
  ```
  $ conda install -c r r
  ```
  Again, proceed with adding all the new packages by pressing `y`.
  Next, add required packages to your environment.
  ```
   conda install -c r r-rcurl r-jsonlite
  ```
  Again proceed by pressing `y`.

  Finally, launch R then set the working directory to the location of this script and execute the script.
  ```
  $ R
  ```
  ```
  > setwd("path/to/this/script")
  > source("downloadAll.R")
  ```

  *Alternatively you can just run the script from the terminal with
  Rscript.*
  ```
  $ Rscript path/to/this/script/downloadAll.R
  ```

  When finished, deactivate the environment and end your session.
  ```
  $ source deactivate REDCapAPI
  ```

## [downloadAll.py](downloadAll.py) - (** Comming soon!**)
