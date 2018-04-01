rankall <- function(outcome, num = "best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  # change data type from character to numeric
  data[, 11] <- as.numeric(data[, 11]) # heart attack
  data[, 17] <- as.numeric(data[, 17]) # heart failure
  data[, 23] <- as.numeric(data[, 23]) # pneumonia
  
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  }
  
col_num <- if (outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else {
    23
  }
state_arr_1 <- data[order(data$State),7]
state_arr<-unique(state_arr_1)


hospital<- vector()

for(i in 1:length(state_arr)){
statedata <- data[data[, 7]==state_arr[i], ]
orderdata <- statedata[order(statedata[, col_num], statedata$Hospital.Name, na.last = NA), ]
  if(num == "best") {
    hospital[i] <- orderdata[1, 2]
  } else if(num == "worst") {
    hospital[i] <- orderdata[nrow(orderdata), 2]
  } else{
    hospital[i] <- orderdata[num, 2]
  }
}

df <- data.frame(hospital=hospital, state=state_arr)
rownames(df) <- state_arr
df
}
