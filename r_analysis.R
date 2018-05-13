#Download the data and unzip mannually
#1.Merges the training and the test sets to create one data set.

      #read xtrain data, y train data, subjects and features data in forms of datatable
      xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
      subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
      ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)
      names.data <- read.table("UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)
      train_table <- cbind(subject, ytrain, xtrain) #combine train tables above into one table by columns 
      names(train_table) <- c("Subject", "Activity", names.data[[2]])

      #read xtest data, y test data and subjects data in forms of datatable
      xtest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
      ytest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)
      subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
      test_table <- cbind(subject_test, ytest, xtest) #combine test table above into one table by columns
      names(test_table) <- c("Subject", "Activity", names.data[[2]])

      data_set <- rbind(train_table, test_table) #Merge training dataset and testing dataset by rows

#2. Uses descriptive activity names to name the activities in the data set
      label_act <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
      for (i in 1:6) {data_set$Activity <- gsub(i, label_act[i,2], data_set$Activity)}
      
#3. Extracts only the measurements on the mean and standard deviation for each measurement.
      library(dplyr)
      selected_name <- grep("mean|std", names(data_set), value = TRUE)
      selected_name <- c("Subject", "Activity", selected_name)
      data_set2 <- data_set[,selected_name]
      
#4. Appropriately labels the data set with descriptive variable names
      names(data_set2) <- sub("^t", "time", names(data_set2))
      names(data_set2) <- sub("^f", "frequency", names(data_set2))

#5. creates a second, independent tidy data set with the average of each variable for each activity 
      #and each subject
      tidy_data <- aggregate(.~ Activity + Subject, data = data_set2, mean)

#6. Export tidy_data to .txt file
      write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
