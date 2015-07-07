install.packages("swirl")
library(swirl)
swirl()

#class options are:
# beginner classes
install_from_swirl("R Programming")  ## completed
install_from_swirl("Data Analysis")
install_from_swirl("Mathematical Biostatistics Boot Camp")
install_from_swirl("Open Intro")
# intermediate classes
install_from_swirl("Regression Models")
install_from_swirl("Getting and Cleaning Data")
# Advanced classes
install_from_swirl("Statistical Inference")
install_from_swirl("Exploratory Data Analysis")
install_from_swirl("Writing swirl Courses")

#| When you are at the R prompt (>):
#| -- Typing skip() allows you to skip the current question.
#| -- Typing play() lets you experiment with R on your own; swirl will ignore what you do...
#| -- UNTIL you type nxt() which will regain swirl's attention.
#| -- Typing bye() causes swirl to exit. Your progress will be saved.
#| -- Typing main() returns you to swirl's main menu.
#| -- Typing info() displays these options again.