

source("https://bioconductor.org/biocLite.R")
if(!require(devtools)) {install.packages("devtools")}

## List of required backages
packages <- c("devtools","BBmisc","caret","datasets","data.table","dplyr","dslabs","genefilter",
              "genomeIntervals","GGally","ggbeeswarm","ggplot2","ggthemes","grid",
              "gridExtra","htmlwidgets","knitr","magrittr","MASS","mclust","mlbench","patchwork",
              "pheatmap","plotly","png","pracma","psych",
              "RColorBrewer","RCurl","readr","readxl","reshape","rhdf5","rmarkdown",
              "RSQLite","slidify","tidyr","tidyverse", "XML", "BiocStyle", 'ggrepel')

## Install all packages
#first install BiocManager 
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

# then install all packages listed
for(p in packages){
    if (!require(p)) BiocManager::install(p)
}

# install additional packages from github
if (!require(patchwork)) devtools::install_github("thomasp85/patchwork")
if (!require(slidyfy)) devtools::install_github('ramnathv/slidify')
if (!require(slidifyLibraries)) devtools::install_github('ramnathv/slidifyLibraries')

## Check that all packages where installed succesfully 
res <- sapply(packages, require, character.only=TRUE)
print( paste('All packages installed:', all(res)))

## if some packages fail you might need to do the following
"""
On some Linux distributions we need the developer libraries for compiling the R packages.

To install those packages, please run as administrator:

For Ubuntu or debian based systems:
sudo apt-get install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev zlib1g-dev libmysqld-dev

For centOS or RHEL based systems:
sudo yum install R-devel zlib-devel openssl-devel libcurl-devel libxml2-devel mariadb-devel
"""

## Check which packages failed:
which(res == FALSE)


