pollutantmean <- function(directory, pollutant, id = 1:332)
{
  file_names<-list.files(directory,full.names=TRUE)
  pollutantdata <- vector("numeric")
  for (i in id)
  {
    data<-read.csv(file_names[i])
    pollutantdata<-c(pollutantdata,data[,pollutant])
  }
  mean(pollutantdata,na.rm=TRUE)
}

