Import multiple files to R
----------
Reference: https://blogazonia.wordpress.com/2014/05/08/import-multiple-files-to-r/

# The code is quite self-explanatory:

setwd("~/R/projects/tutorials/import_multiple_data_to_R/")

list.filenames<-list.files(pattern=".csv$")

list.data<-list()

for (i in 1:length(list.filenames))
{
list.data[[i]]<-read.csv(list.filenames[i])
}

 
### add the names of your data to the list
names(list.data)<-list.filenames
### now you can index one of your tables like this
list.data$deforestation2010.csv
### or this
list.data[1]
 
