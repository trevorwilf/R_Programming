library(plyr)
#library(gtools)
rankall <- function(stroutcome, strrank = "best"){
  
  #constants
  Validoutcomes <-  c("heart attack", "heart failure", "pneumonia")
  validstates <- as.data.frame(unique(read.csv("outcome-of-care-measures.csv", header=TRUE)[, c('State')]))
  validstates <- arrange(validstates, validstates[1])
  
  #check to make sure inputs are valid
  if (!is.element(stroutcome, Validoutcomes)) stop("invalid Outcome")
  
  #return the results
  if (stroutcome == "heart attack") alloutcomeresults <- as.data.frame(read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses="character")[, c(2, 7, 11)])
  if (stroutcome == "heart failure") alloutcomeresults <- as.data.frame(read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses="character")[, c(2, 7, 17)])
  if (stroutcome == "pneumonia") alloutcomeresults <- as.data.frame(read.csv("outcome-of-care-measures.csv", header=TRUE, colClasses="character")[, c(2, 7, 23)])
  
  colnames(alloutcomeresults)[3] <- "outcome"
  colnames(alloutcomeresults)[2] <- "state"
  colnames(alloutcomeresults)[1] <- "hospital"
  cleanoutcomeresults <- subset.data.frame(alloutcomeresults, outcome != "Not Available")
  x <- NULL
  
  if (strrank == "best") {
    for (strstate in as.matrix(validstates)) {
      stateoutcomeresults <- subset.data.frame(cleanoutcomeresults, state == strstate)
      x <- rbind(x, (head(arrange(stateoutcomeresults, (as.numeric(outcome))),1)[1:2]))
    }
  } else { 
    if (strrank == "worst") {
        for (strstate in as.matrix(validstates)) {
          stateoutcomeresults <- subset.data.frame(cleanoutcomeresults, state == strstate)
          x <- rbind(x, (tail(arrange(stateoutcomeresults, (as.numeric(outcome))),1)[1:2]))
        }
    } else {
        for (strstate in as.matrix(validstates)) {
          stateoutcomeresults <- subset.data.frame(cleanoutcomeresults, state == strstate)
          if  (as.numeric(strrank) < nrow(stateoutcomeresults)) {
            sortedstateoutcomeresults <- arrange(stateoutcomeresults, (as.numeric(outcome)), hospital)[1:2]
            x <- rbind.fill(x, sortedstateoutcomeresults[strrank,])
          } else {
            tempdf <- data.frame(state = strstate)
            x <- rbind.fill(x, tempdf)
          }         
        }
    }
  }
  return(x[c("hospital", "state")])
}