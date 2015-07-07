setwd("c:/github/R_Programming")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

best <- function(strstate, stroutcome){
  
  #constants
  Validoutcomes <-  c("heart attack", "heart failure", "pneumonia")
  validstates <- unique(read.csv("outcome-of-care-measures.csv", header=TRUE)[, c('State')])
  
  #check to make sure inputs are valid
  if (!is.element(strstate, validstates)) return "invalid state"
  if (!is.element(stroutcome, Validoutcomes)) return "invalid Outcome"
  
  
  outcomestring <- paste("Hospital 30-Day Death (Mortality) Rates from", stroutcome, sep=" ")
  #alloutcomeresults <- read.csv("outcome-of-care-measures.csv", header=TRUE)[, c('State', cat(outcomestring))]
  
  alloutcomeresults <- read.csv("outcome-of-care-measures.csv", header=TRUE)
  #stateoutcomeresults <- subset(alloutcomeresults, State==cat(strstate))
  
  return(alloutcomeresults)
  
  
}

a <- best("ID", "Heart Attack")