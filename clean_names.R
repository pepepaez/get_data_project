clean_names<-function(x){
     
     ## Create a simple data frame with the sequence of patterns and
     ## replacement values
     clean_sequence <- data.frame(pattern=c("^t","^f","Acc","-mean\\(\\)",
                                            "-std\\(\\)","-X","-Y","-Z","Mag",
                                            "Jerk","-meanFreq\\(\\)","Gyro",
                                            "angle","\\(t",",gravity",
                                            "BodyBody","\\(|\\)|_$","Gyro",
                                            "_+|\b+"),
                                  replacement=c("time_","frequency_", 
                                                "_acceleration_","_mean",
                                                "_std_dev", "_on_X","_on_Y",
                                                "_on_Z", "magnitude","jerk_",
                                                "_mean_freq","_gyroscope_",
                                                "angle_","_time ","_gravity_",
                                                "body","","gyroscope_","_"))

     ## Cycle through the data frame, by using gsub to find and replace each
     ## item on the list we can clean up the entire data set
     for(i in 1:nrow(clean_sequence)){
          x$variable <- gsub(clean_sequence[i,1],clean_sequence[i,2],x$variable)
     }
     
     ## Set all variable names to lowercase to make it easier to read
     x$variable <- tolower(x$variable)
     
     ## Return cleaned up dataset
     x
}