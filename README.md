#  The purpose of this analysis  is to extract the information from the UCI HAR Dataset, perform a mean summarise and export into a tidy data set.
The run_analysis.R file does the following things:
1) Setup your working directory (the selected directory here is just outside of the folder "UCI HAR Dataset")
2) Load necessary packages for the analysis
3) Merging the test and trainning data set
4) Name the activities in the data set by the file "activity_labels.txt"
5) Extracts the measurements on the mean and standard deviation for each measurement
6) Create and export an independent tidy dataset with the average of each variable for each activity and each subject in to a txt file

