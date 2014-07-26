# Data Dictionary - Andy Sherman's "Getting & Cleaning Data" Course Project

## ID Variables

### Subject
   Subject identifier.  This is an int between 1 and 30.
   
### Activity
   Activity performed by the subject in the observation. A character of 
   1. LAYING
   2. SITTING
   3. STANDING
   4. WALKING
   5. WALKING_DOWNSTAIRS
   6. WALKING_UPSTAIRS
   
## Measurement Variables
   The following variables are the mean by subject by activity from the original Android gyrometer and accelerometer measurements carried out in the UCI[1].  In order to do this, I melted the joined data set by the variables, defined Subject and Activity as IDs, and carried out a mean fucntion on the variables (using dcast()).

To quote how the original measurements were made:
		The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
		Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
		Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

Here are the variables in the tidy data set:

	 [3] "mean.Time.Body.Accelerometer.mean().X"          "mean.Time.Body.Accelerometer.mean().Y"         
	 [5] "mean.Time.Body.Accelerometer.mean().Z"          "mean.Time.Body.Accelerometer.std().X"          
	 [7] "mean.Time.Body.Accelerometer.std().Y"           "mean.Time.Body.Accelerometer.std().Z"          
	 [9] "mean.Time.Gravity.Accelerometer.mean().X"       "mean.Time.Gravity.Accelerometer.mean().Y"      
	[11] "mean.Time.Gravity.Accelerometer.mean().Z"       "mean.Time.Gravity.Accelerometer.std().X"       
	[13] "mean.Time.Gravity.Accelerometer.std().Y"        "mean.Time.Gravity.Accelerometer.std().Z"       
	[15] "mean.Time.Body.AccelerometerJerk.mean().X"      "mean.Time.Body.AccelerometerJerk.mean().Y"     
	[17] "mean.Time.Body.AccelerometerJerk.mean().Z"      "mean.Time.Body.AccelerometerJerk.std().X"      
	[19] "mean.Time.Body.AccelerometerJerk.std().Y"       "mean.Time.Body.AccelerometerJerk.std().Z"      
	[21] "mean.Time.Body.Gyroscope.mean().X"              "mean.Time.Body.Gyroscope.mean().Y"             
	[23] "mean.Time.Body.Gyroscope.mean().Z"              "mean.Time.Body.Gyroscope.std().X"              
	[25] "mean.Time.Body.Gyroscope.std().Y"               "mean.Time.Body.Gyroscope.std().Z"              
	[27] "mean.Time.Body.GyroscopeJerk.mean().X"          "mean.Time.Body.GyroscopeJerk.mean().Y"         
	[29] "mean.Time.Body.GyroscopeJerk.mean().Z"          "mean.Time.Body.GyroscopeJerk.std().X"          
	[31] "mean.Time.Body.GyroscopeJerk.std().Y"           "mean.Time.Body.GyroscopeJerk.std().Z"          
	[33] "mean.Time.Body.AccelerometerMag.mean()"         "mean.Time.Body.AccelerometerMag.std()"         
	[35] "mean.Time.Gravity.AccelerometerMag.mean()"      "mean.Time.Gravity.AccelerometerMag.std()"      
	[37] "mean.Time.Body.AccelerometerJerkMag.mean()"     "mean.Time.Body.AccelerometerJerkMag.std()"     
	[39] "mean.Time.Body.GyroscopeMag.mean()"             "mean.Time.Body.GyroscopeMag.std()"             
	[41] "mean.Time.Body.GyroscopeJerkMag.mean()"         "mean.Time.Body.GyroscopeJerkMag.std()"         
	[43] "mean.Frequency.Body.Accelerometer.mean().X"     "mean.Frequency.Body.Accelerometer.mean().Y"    
	[45] "mean.Frequency.Body.Accelerometer.mean().Z"     "mean.Frequency.Body.Accelerometer.std().X"     
	[47] "mean.Frequency.Body.Accelerometer.std().Y"      "mean.Frequency.Body.Accelerometer.std().Z"     
	[49] "mean.Frequency.Body.AccelerometerJerk.mean().X" "mean.Frequency.Body.AccelerometerJerk.mean().Y"
	[51] "mean.Frequency.Body.AccelerometerJerk.mean().Z" "mean.Frequency.Body.AccelerometerJerk.std().X" 
	[53] "mean.Frequency.Body.AccelerometerJerk.std().Y"  "mean.Frequency.Body.AccelerometerJerk.std().Z" 
	[55] "mean.Frequency.Body.Gyroscope.mean().X"         "mean.Frequency.Body.Gyroscope.mean().Y"        
	[57] "mean.Frequency.Body.Gyroscope.mean().Z"         "mean.Frequency.Body.Gyroscope.std().X"         
	[59] "mean.Frequency.Body.Gyroscope.std().Y"          "mean.Frequency.Body.Gyroscope.std().Z"         
	[61] "mean.Frequency.Body.AccelerometerMag.mean()"    "mean.Frequency.Body.AccelerometerMag.std()"    
	[63] "mean.Frequency.BodyAccelerometerJerkMag.mean()" "mean.Frequency.BodyAccelerometerJerkMag.std()" 
	[65] "mean.Frequency.BodyGyroscopeMag.mean()"         "mean.Frequency.BodyGyroscopeMag.std()"         
	[67] "mean.Frequency.BodyGyroscopeJerkMag.mean()"     "mean.Frequency.BodyGyroscopeJerkMag.std()"

More can be found in the original files features.txt (names of the source variables) and features_info.txt (description of how the original values were derived).

*Note that the names of the last 6 variables differ from their source variables in that they don't contain a repetition of the term 'Body', e.g. mean.fBodyGyroJerkMag.std is a mean of the source variable fBodyBodyGyroJerkMag-std()
   
[[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)