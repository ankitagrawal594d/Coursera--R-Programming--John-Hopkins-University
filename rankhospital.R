rankhospital <- function(state, outcome, num = "best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  # change data type from character to numeric
  data[, 11] <- as.numeric(data[, 11]) # heart attack
  data[, 17] <- as.numeric(data[, 17]) # heart failure
  data[, 23] <- as.numeric(data[, 23]) # pneumonia
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  ## Check that state and outcome are valid
  if (!state %in% data$State) {
    stop("invalid state")
  }
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
  statedata <- data[data[, 7]==state, ]
  orderdata <- statedata[order(statedata[, col_num], statedata$Hospital.Name, na.last = NA), ]
  if(num == "best") {
    orderdata[1, 2]
  } else if(num == "worst") {
    orderdata[nrow(orderdata), 2]
  } else{
    orderdata[num, 2]
  }
}
