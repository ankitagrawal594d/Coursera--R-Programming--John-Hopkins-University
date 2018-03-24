Reference: https://blogazonia.wordpress.com/2014/05/08/import-multiple-files-to-r/

Import multiple files to R
----------
### The code is quite self-explanatory:
## import_multiple_csv_files_to_R
# Purpose: Import multiple csv files to the Global Environment in R
 
# set working directory
setwd("~/R/projects/tutorials/import_multiple_data_to_R/")
 
# list all csv files from the current directory
list.files(pattern=".csv$") # use the pattern argument to define a common pattern  for import files with regex. Here: .csv
 
# create a list from these files
list.filenames<-list.files(pattern=".csv$")
list.filenames
 
# create an empty list that will serve as a container to receive the incoming files
list.data<-list()
 
# create a loop to read in your data
for (i in 1:length(list.filenames))
{
list.data[[i]]<-read.csv(list.filenames[i])
}
 
# add the names of your data to the list
names(list.data)<-list.filenames
 
# now you can index one of your tables like this
list.data$deforestation2010.csv
 
# or this
list.data[1]
 
# you can make a function out of this
import.multiple.csv.files<-function(mypath,mypattern,...)
{
tmp.list.1<-list.files(mypath, pattern=mypattern)
tmp.list.2<-list(length=length(tmp.list.1))
for (i in 1:length(tmp.list.1)){tmp.list.2[[i]]<-read.csv(tmp.list.1[i],...)}
names(tmp.list.2)<-tmp.list.1
tmp.list.2
}
 
# use it like this
csv.import<-import.multiple.csv.files("~/R/projects/tutorials/import_multiple_data_to_R/",".csv$",sep=",")
# note: with ... we enable the function to refine the import with parameters from read.csv.
# here we define the separator of entries in the csv files to be comma.
 
# save it to the folder with your custom functions
save(import.multiple.csv.files,file="~/R/functions/import.multiple.csv.files.RData")
 
# load it like this whenever you need it in another script with
load("~/R/functions/import.multiple.csv.files.RData")
 
# end
