CodeBook
================

# Variables

1.  **activity**: Takes one of 6 values which represent the activity
    that the test subject was doing.
    1.  WALKING
    2.  WALKING\_UPSTAIRS
    3.  WALKING\_DOWNSTAIRS
    4.  SITTING
    5.  STANDING
    6.  LAYING
2.  **subject\_id**: Takes values from 1 to 30 which identify each
    person taking part as a test subject.
3.  “tBodyAcc-mean()-X”: average of **t**ime domain **Body**
    **Acc**elerometer **mean()** in the **X** direction.
4.  “tBodyAcc-mean()-Y”
5.  “tBodyAcc-mean()-Z”  
6.  “tBodyAcc-std()-X”: average of **t**ime domain **Body**
    **Acc**elerometer **standard deviation()** in the **X** direction.  
7.  “tBodyAcc-std()-Y”  
8.  “tBodyAcc-std()-Z”  
9.  “tGravityAcc-mean()-X”  
10. “tGravityAcc-mean()-Y”  
11. “tGravityAcc-mean()-Z”  
12. “tGravityAcc-std()-X”  
13. “tGravityAcc-std()-Y”  
14. “tGravityAcc-std()-Z”  
15. “tBodyAccJerk-mean()-X”  
16. “tBodyAccJerk-mean()-Y”  
17. “tBodyAccJerk-mean()-Z”  
18. “tBodyAccJerk-std()-X”  
19. “tBodyAccJerk-std()-Y”  
20. “tBodyAccJerk-std()-Z”  
21. “tBodyGyro-mean()-X”  
22. “tBodyGyro-mean()-Y”  
23. “tBodyGyro-mean()-Z”  
24. “tBodyGyro-std()-X”  
25. “tBodyGyro-std()-Y”  
26. “tBodyGyro-std()-Z”  
27. “tBodyGyroJerk-mean()-X”  
28. “tBodyGyroJerk-mean()-Y”  
29. “tBodyGyroJerk-mean()-Z”  
30. “tBodyGyroJerk-std()-X”  
31. “tBodyGyroJerk-std()-Y”  
32. “tBodyGyroJerk-std()-Z”  
33. “tBodyAccMag-mean()”  
34. “tBodyAccMag-std()”  
35. “tGravityAccMag-mean()”  
36. “tGravityAccMag-std()”  
37. “tBodyAccJerkMag-mean()”  
38. “tBodyAccJerkMag-std()”  
39. “tBodyGyroMag-mean()”  
40. “tBodyGyroMag-std()”  
41. “tBodyGyroJerkMag-mean()”  
42. “tBodyGyroJerkMag-std()”  
43. “fBodyAcc-mean()-X”: average of **f**requency domain **Body**
    **Acc**elerometer **mean()** in the **X** direction.  
44. “fBodyAcc-mean()-Y”  
45. “fBodyAcc-mean()-Z”  
46. “fBodyAcc-std()-X”  
47. “fBodyAcc-std()-Y”  
48. “fBodyAcc-std()-Z”  
49. “fBodyAccJerk-mean()-X”  
50. “fBodyAccJerk-mean()-Y”  
51. “fBodyAccJerk-mean()-Z”  
52. “fBodyAccJerk-std()-X”  
53. “fBodyAccJerk-std()-Y”  
54. “fBodyAccJerk-std()-Z”  
55. “fBodyGyro-mean()-X”: average of **f**requency domain **Body**
    **Gyro**scope **mean()** in the **X** direction.  
56. “fBodyGyro-mean()-Y”  
57. “fBodyGyro-mean()-Z”  
58. “fBodyGyro-std()-X”  
59. “fBodyGyro-std()-Y”  
60. “fBodyGyro-std()-Z”  
61. “fBodyAccMag-mean()”  
62. “fBodyAccMag-std()”  
63. “fBodyBodyAccJerkMag-mean()”
64. “fBodyBodyAccJerkMag-std()”  
65. “fBodyBodyGyroMag-mean()”  
66. “fBodyBodyGyroMag-std()”  
67. “fBodyBodyGyroJerkMag-mean()”
68. “fBodyBodyGyroJerkMag-std()”

**Note:** The meaning of the variable can be inferred from the variable
names based on the examples provided. The prefix **t** or **f**
determines time or frequency domain data. Then the recorded acceleration
is either due to **Body** or **Gravity** which is recorded by either an
**Acc**elerometer or a **Gyro**scope. Finally either the **mean** or the
**standard deviation** is taken of the measurement.

# Data

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).

# Transformations

The raw data was divided into test and training sets. The X\_test and
X\_train files contained 561 features and a total of 10299 rows The
names of the 561 features were also provided in a separate file which
were combined at the time of loading the X test and train data. The
y\_test and y\_train files contained the activity values coded from 1-6,
also for a total of 10299 rows. Subject\_test and subject\_train files
contained the respective subject ids from 1-30. First all the data in
the X\_test and X\_train files was combined by stacking rows, The same
was done with the Y and subject files. There were also provided inertial
signals for test and train sets which were combined by stacking rows the
same as X, y and subjects. Finally all 4 of these separate datasets were
column binded together to form a full wide dataset called **fulldata**.

From **fulldata** we only extract those variables which are the
calculated means and standard deviations of our measurements as defined
in their variable names through **-mean()-** and **-std()-**. This
extracted subset is named **mean-std**. The y values which represent
activities were initally encoded as integers from 1-6 and they were
recoded to their full string names that were also provided in the
raw\_data set as **activity\_labels**.

Finally from this **mean-std** dataset we further create a new averaged
dataset by first grouping by **activities** and **subject\_id**. Then we
take the mean() of every variable for each activity and each subject.
This final averaged dataset is then written as a csv file called
**averaged\_data.csv**.
