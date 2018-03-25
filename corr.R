corr <- function(directory, threshold=0)
  {
  file_names <- list.files(directory, full.names = TRUE)
  dat <- numeric()
  for (i in 1:length(file_names)){
    moni_i <- read.csv(file_names[i])
    nobs <- sum(complete.cases(moni_i))
    if (nobs>threshold){
    dat <- c(dat, cor(moni_i$sulfate, moni_i$nitrate,use="complete.obs")) 
     }
  }
  dat
}
