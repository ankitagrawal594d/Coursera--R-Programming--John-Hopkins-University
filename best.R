## Read outcome data
best <- function(state, outcome){
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
## Return hospital name in that state with lowest 30-day death rate

col_num <- if (outcome == "heart attack") {
  11
} else if (outcome == "heart failure") {
  17
} else {
  23
}
state_subset <- data[data[, 7]==state, ]
outcome_arr <- state_subset[, col_num]
min <- min(outcome_arr, na.rm=TRUE)
min_index <- which(outcome_arr == min)
hosp_name <- state_subset[min_index, 2]
hosp_name_sort <-sort(hosp_name)
hosp_name_sort[1]
}
