# Merge the training and the test sets to create one data set.
features <- read_delim("features.txt", " ", col_names=FALSE)
xtest <- read_delim("test/X_test.txt"," ", col_types = cols(.default = col_number()), 
                    col_names = features$X2)
xtrain <- read_delim("train/X_train.txt"," ", col_types = cols(.default = col_number()), 
                     col_names = features$X2)
ytest <- read_csv("test/y_test.txt", col_names = c("activity"))
ytrain <- read_csv("train/y_train.txt", col_names = c("activity"))
subject_test <- read_csv("test/subject_test.txt", col_names = c("subject_id"))
subject_train <- read_csv("train/subject_train.txt", col_names = c("subject_id"))

body_acc_x_test <- read_delim("test/Inertial Signals/body_acc_x_test.txt", " ", col_names=FALSE, 
                   col_types = cols(.default = col_number()))
body_acc_y_test <- read_delim("test/Inertial Signals/body_acc_y_test.txt", " ", col_names=FALSE, 
                              col_types = cols(.default = col_number()))
body_acc_z_test <- read_delim("test/Inertial Signals/body_acc_z_test.txt", " ", col_names=FALSE, 
                              col_types = cols(.default = col_number()))

body_gyro_x_test <- read_delim("test/Inertial Signals/body_gyro_x_test.txt", " ", col_names=FALSE, 
                              col_types = cols(.default = col_number()))
body_gyro_y_test <- read_delim("test/Inertial Signals/body_gyro_y_test.txt", " ", col_names=FALSE, 
                               col_types = cols(.default = col_number()))
body_gyro_z_test <- read_delim("test/Inertial Signals/body_gyro_z_test.txt", " ", col_names=FALSE, 
                               col_types = cols(.default = col_number()))

total_acc_x_test <- read_delim("test/Inertial Signals/total_acc_x_test.txt", " ", col_names=FALSE, 
                               col_types = cols(.default = col_number()))
total_acc_y_test <- read_delim("test/Inertial Signals/total_acc_y_test.txt", " ", col_names=FALSE, 
                               col_types = cols(.default = col_number()))
total_acc_z_test <- read_delim("test/Inertial Signals/total_acc_z_test.txt", " ", col_names=FALSE, 
                               col_types = cols(.default = col_number()))


x <- bind_rows(xtest, xtrain)
y <- bind_rows(ytrain, ytest)
subject <- bind_rows(subject_train, subject_test)
fulldata <- bind_cols(subject, y, x)

# Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_col_indices <- grep(".*-mean\\(\\).*|.*-std\\(\\).*", names(fulldata))
mean_std <- fulldata %>% select(subject_id, activity, all_of(mean_std_col_indices))

# Uses descriptive activity names to name the activities in the data set
activities <- read_delim("activity_labels.txt", " ", col_names=FALSE)

# Appropriately labels the data set with descriptive variable names.

# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.