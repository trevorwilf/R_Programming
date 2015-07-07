library(plyr)
best <- function(strstate, stroutcome){
  
  #constants
  Validoutcomes <-  c("heart attack", "heart failure", "pneumonia")
  validstates <- unique(read.csv("outcome-of-care-measures.csv", header=TRUE)[, c('State')])
  
  #check to make sure inputs are valid
  if (!is.element(strstate, validstates)) stop("invalid state")
  if (!is.element(stroutcome, Validoutcomes)) stop("invalid Outcome")
  
  #return the results
  if (stroutcome == "heart attack") alloutcomeresults <- as.data.frame(read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses="character")[, c(2, 7, 11)])
  if (stroutcome == "heart failure") alloutcomeresults <- as.data.frame(read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses="character")[, c(2, 7, 17)])
  if (stroutcome == "pneumonia") alloutcomeresults <- as.data.frame(read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses="character")[, c(2, 7, 23)])
  
  colnames(alloutcomeresults)[3] <- "outcome"
  stateoutcomeresults <- subset.data.frame(alloutcomeresults, State == strstate & outcome != "Not Available")
  return(head(arrange(stateoutcomeresults, (as.numeric(outcome))),1)[[1]])
}