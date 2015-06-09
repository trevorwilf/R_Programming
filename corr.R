corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!

  truecandidates <- subset.data.frame(complete(directory), nobs >= threshold)  
  filenames <- list.files(directory, pattern=".csv", full.names = TRUE)[truecandidates[[1]]]
  corr_result <- c()
  
  for (file in filenames)
  {
    current <- read.csv(file, header = TRUE)
    corr_result <- c(corr_result, cor(current$sulfate, current$nitrate, use = "pairwise.complete.obs"))
  }
    
  return(corr_result)
}