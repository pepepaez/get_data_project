run_analysis <- function(){
     # Load packages that we will use
     library(plyr)
     library(reshape2)
     source("clean_names.R")
     
     ## Load feature names, this will help in identifying data points
     ## to extract from test and train data
     measurement_labels <- read.table("./Data/features.txt", 
                                      stringsAsFactors = F)
     
     ## We only need the second column which contains the actual name of each 
     ## measurement
     measurement_labels <- measurement_labels[,2]
     
     ## Load activity labels, these will be used to make it easy to identify the 
     ## activity for which each variable is being measured
     activity_labels <- read.table("./Data/activity_labels.txt", 
                                   col.names = c("activity_id", "activity_name"))
     
     # Load data on individual variables
     
     ## TEST DATA
     subject_test <- read.table("./Data/test/subject_test.txt", 
                                col.names = "subject_id")
     y_test <- read.table("./Data/test/y_test.txt", col.names = "activity_id")
     x_test <- read.table("./Data/test/X_test.txt")
     
     ## TRAIN DATA
     subject_train <- read.table("./Data/train/subject_train.txt", 
                                 col.names = "subject_id")
     y_train <- read.table("./Data/train/y_train.txt", col.names = "activity_id")
     x_train <- read.table("./Data/train/X_train.txt")

     ## Assign the measurement labels to each column
     colnames(x_test) <- measurement_labels
     colnames(x_train) <- measurement_labels

     ## Because we only care for the mean and standard deviation of each 
     ## measurement, lets find the indices of those columns using a simple 
     ## regular expression
     indices <- grep ("(m|M)ean|std",measurement_labels)
     
     ## Extract only the columns where we had a match for mean() or std()
     x_test <- x_test[,indices]
     x_train <- x_train[,indices]
     
     ## We get data frames that have the same number of rows
     ## so we assume that the data matches perfectly by the order
     ## of the records
     
     ## Merge the train and test datasets separately and then create one 
     ## complete data set
     test_data <- cbind(subject_test, y_test, x_test)
     train_data <- cbind(subject_train, y_train, x_train)
     
     ## Finally merge both data sets
     data <- rbind(test_data, train_data)
     
     ## We use the melt function to create a row for each measurement column, 
     ## this will make it easier to calculate the average later on
     data_melt <- melt(data, id=c("subject_id","activity_id"),
                      measure.vars=grep("(m|M)ean|std", 
                                        names(data)))
     
     ## With this we can now calculate the average for each measurement 
     ## using ddply
     data_means <- ddply(data_melt,.(subject_id, activity_id, variable), 
                       summarize, mean=mean(value))
     
     ## We add the activity labels to the resulting data so we can 
     ## easily identify the activities
     data_means <- merge(data_means, activity_labels, by.x = "activity_id", 
                         by.y = "activity_id")
     
     ## Reorder columns and sort the data to make it readable
     data_means <- data_means[,c("subject_id", "activity_id", "activity_name", 
                                 "variable", "mean")]
     data_means <- arrange(data_means, subject_id, activity_id, variable)
     
     ## Clean variable names
     data_means <- clean_names(data_means)
     
     ## Write output of analysis to file for distribution
     write.table(data_means, file="./Data/output_analysis.txt", row.name=FALSE)
}