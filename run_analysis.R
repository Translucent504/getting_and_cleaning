library(tidyverse)

if(!file.exists("averaged_data.csv")){
    
    # Merge the training and the test sets to create one data set.
    features <- read_delim("raw_data/features.txt", " ", col_names=FALSE)
    xtest <- read_delim("raw_data/test/X_test.txt"," ", col_types = cols(.default = col_number()), 
                        col_names = features$X2)
    xtrain <- read_delim("raw_data/train/X_train.txt"," ", col_types = cols(.default = col_number()), 
                         col_names = features$X2)
    ytest <- read_csv("raw_data/test/y_test.txt", col_names = c("activity"))
    ytrain <- read_csv("raw_data/train/y_train.txt", col_names = c("activity"))
    subject_test <- read_csv("raw_data/test/subject_test.txt", col_names = c("subject_id"))
    subject_train <- read_csv("raw_data/train/subject_train.txt", col_names = c("subject_id"))
    
    
    ############### Inertial Data Loading ##########################################
    body_acc_x_test <- read_delim("raw_data/test/Inertial Signals/body_acc_x_test.txt", " ", col_names=FALSE, 
                       col_types = cols(.default = col_number()))
    body_acc_y_test <- read_delim("raw_data/test/Inertial Signals/body_acc_y_test.txt", " ", col_names=FALSE, 
                                  col_types = cols(.default = col_number()))
    body_acc_z_test <- read_delim("raw_data/test/Inertial Signals/body_acc_z_test.txt", " ", col_names=FALSE, 
                                  col_types = cols(.default = col_number()))
    
    body_gyro_x_test <- read_delim("raw_data/test/Inertial Signals/body_gyro_x_test.txt", " ", col_names=FALSE, 
                                  col_types = cols(.default = col_number()))
    body_gyro_y_test <- read_delim("raw_data/test/Inertial Signals/body_gyro_y_test.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    body_gyro_z_test <- read_delim("raw_data/test/Inertial Signals/body_gyro_z_test.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    
    total_acc_x_test <- read_delim("raw_data/test/Inertial Signals/total_acc_x_test.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    total_acc_y_test <- read_delim("raw_data/test/Inertial Signals/total_acc_y_test.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    total_acc_z_test <- read_delim("raw_data/test/Inertial Signals/total_acc_z_test.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    
    body_acc_x_train <- read_delim("raw_data/train/Inertial Signals/body_acc_x_train.txt", " ", col_names=FALSE, 
                                  col_types = cols(.default = col_number()))
    body_acc_y_train <- read_delim("raw_data/train/Inertial Signals/body_acc_y_train.txt", " ", col_names=FALSE, 
                                  col_types = cols(.default = col_number()))
    body_acc_z_train <- read_delim("raw_data/train/Inertial Signals/body_acc_z_train.txt", " ", col_names=FALSE, 
                                  col_types = cols(.default = col_number()))
    
    body_gyro_x_train <- read_delim("raw_data/train/Inertial Signals/body_gyro_x_train.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    body_gyro_y_train <- read_delim("raw_data/train/Inertial Signals/body_gyro_y_train.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    body_gyro_z_train <- read_delim("raw_data/train/Inertial Signals/body_gyro_z_train.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    
    total_acc_x_train <- read_delim("raw_data/train/Inertial Signals/total_acc_x_train.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    total_acc_y_train <- read_delim("raw_data/train/Inertial Signals/total_acc_y_train.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    total_acc_z_train <- read_delim("raw_data/train/Inertial Signals/total_acc_z_train.txt", " ", col_names=FALSE, 
                                   col_types = cols(.default = col_number()))
    ################################################################################
    
    ####### Inertial Data Combining #######################
    bax <- bind_rows(body_acc_x_train, body_acc_x_test)
    names(bax) <- paste("bax", seq(1,128), sep="")
    bay <- bind_rows(body_acc_y_train, body_acc_y_test)
    names(bay) <- paste("bay", seq(1,128), sep="")
    baz <- bind_rows(body_acc_z_train, body_acc_z_test)
    names(baz) <- paste("baz", seq(1,128), sep="")
    tax <- bind_rows(total_acc_x_train, total_acc_x_test)
    names(tax) <- paste("tax", seq(1,128), sep="")
    tay <- bind_rows(total_acc_y_train, total_acc_y_test)
    names(tay) <- paste("tay", seq(1,128), sep="")
    taz <- bind_rows(total_acc_z_train, total_acc_z_test)
    names(taz) <- paste("taz", seq(1,128), sep="")
    bgx <- bind_rows(body_gyro_x_train, body_gyro_x_test)
    names(bgx) <- paste("bgx", seq(1,128), sep="")
    bgy <- bind_rows(body_gyro_y_train, body_gyro_y_test)
    names(bgy) <- paste("bgy", seq(1,128), sep="")
    bgz <- bind_rows(body_gyro_z_train, body_gyro_z_test)
    names(bgz) <- paste("bgz", seq(1,128), sep="")
    ########################################################
    
    x <- bind_rows(xtrain, xtest)
    y <- bind_rows(ytrain, ytest)
    subject <- bind_rows(subject_train, subject_test)
    fulldata <- bind_cols(subject, y, x, tax, tay, taz, bax, bay, baz, bgx, bay, bgz)
    
    ## This Produces a tidy ~190 MB file with every single variable from the dataset.
    #if(!file.exists("full_wide_data.csv")){
    #    write.csv(fulldata, file = "full_wide_data.csv", row.names = FALSE)
    #} 
    
    # Extracts only the measurements on the mean and standard deviation for each measurement.
    mean_std_col_indices <- grep(".*-mean\\(\\).*|.*-std\\(\\).*", names(fulldata))
    mean_std <- fulldata %>% select(subject_id, activity, all_of(mean_std_col_indices))
    
    # Uses descriptive activity names to name the activities in the data set
    # Merging or joining would be better if we had a larger number of activites.
    activities <- read_delim("raw_data/activity_labels.txt", " ", col_names=FALSE)
    mean_std <- mean_std %>% mutate(activity=recode(activity, `1`=activities[[1,2]], 
                                                    `2`=activities[[2,2]], `3`=activities[[3,2]], 
                                                    `4`=activities[[4,2]], `5`=activities[[5,2]], 
                                                        `6`=activities[[6,2]]))
    # Appropriately labels the data set with descriptive variable names.
    # Already done in the first step when loading data.
    # From the data set in step 4, creates a second, independent tidy data set with 
    # the average of each variable for each activity and each subject.
    mean_std <- mean_std %>% group_by(activity, subject_id)
    final_average_dataset <- mean_std %>% summarise_all(mean, na.rm=TRUE)
    write.csv(final_average_dataset, file = "averaged_data.csv", row.names = FALSE)
}




