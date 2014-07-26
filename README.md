# Getting & Cleaning Data Course Project ReadMe

The following is a description of the files in the github repo and how the scripts created a tidy data set.

### run_analysis.R
This is the script to create the data set with only the mean and std measurements from the original UCI measurement data (table "mean_std_set") tidy data set with the mean of the mean and std values by subject by activity (table "tidy").

The following code first reads in the test and training data:
	subject_test <-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/test/subject_test.txt");
	X_test<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/test/X_test.txt");
	y_test<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/test/y_test.txt");
	subject_train <-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/train/subject_train.txt");
	X_train<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/train/X_train.txt");
	y_train<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/train/y_train.txt");

The following code reads in the names of the measurements, merges the data read in earlier and names the measurement columns based on the "features.txt" file
	features<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/features.txt", colClasses = "character");
	subjects_data<-rbind(subject_test,subject_train);
	y_data<-rbind(y_test,y_train);
	X_data<-rbind(X_test,X_train);
	names(X_data)<-as.list(features[,2]);
	new_raw_set <-cbind(subjects_data,y_data,X_data);
	
The following code pulls out the mean() and std() measurements from the X_test and X_train data.  The column numbers were derieved from the features.txt data set.
	mean_std_set<- new_raw_set[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)];

The following code renames the activities, changing them from a code/integer for each activity into a character that describes the action
	mean_std_set$V1.1[mean_std_set$V1.1==1] <- "WALKING";
	mean_std_set$V1.1[mean_std_set$V1.1==2] <- "WALKING_UPSTAIRS";
	mean_std_set$V1.1[mean_std_set$V1.1==3] <- "WALKING_DOWNSTAIRS";
	mean_std_set$V1.1[mean_std_set$V1.1==4] <- "SITTING";
	mean_std_set$V1.1[mean_std_set$V1.1==5] <- "STANDING";
	mean_std_set$V1.1[mean_std_set$V1.1==6] <- "LAYING";

The following code names and renames the column names in order to improve clarity around what each column data represents
	names(mean_std_set)<-gsub("tBody", "Time.Body.", names(mean_std_set));
	names(mean_std_set)<-gsub("tGravity", "Time.Gravity.", names(mean_std_set));
	names(mean_std_set)<-gsub("fBody", "Frequency.Body.", names(mean_std_set));
	names(mean_std_set)<-gsub("fBody", "Frequency.Body.", names(mean_std_set));
	names(mean_std_set)<-gsub("Acc", "Accelerometer", names(mean_std_set));
	names(mean_std_set)<-gsub("Gyro", "Gyroscope", names(mean_std_set));
	names(mean_std_set)<-gsub("Body.Body", "Body", names(mean_std_set));
	names(mean_std_set)<-gsub("()", "", names(mean_std_set));
	names(mean_std_set)<-gsub("-", ".", names(mean_std_set));
	names(mean_std_set)[1]<-"Subject";
	names(mean_std_set)[2]<-"Activity";

Finally, the following code melts down the data set (setting Subject and Activity as IDs, setting the measurements as variables) and uses the dcast function to calculate the mean of each measurement by subject by activity.  It renames the column names to indicate that they display the mean value of the original calculations.  It then write out the tidy data set to "tidy.txt"
	var_cols<-names(mean_std_set)[c(3:68)];
	melt_mean_std_set <-melt(mean_std_set, id=c("Subject", "Activity"), measure.vars=var_cols);
	tidy<-dcast(melt_mean_std_set, Subject + Activity ~ variable, mean);
	names(tidy)<-gsub("Time", "mean.Time", names(tidy));
	names(tidy)<-gsub("Frequency", "mean.Frequency", names(tidy));
	write.table(tidy,file="tidy.txt");

The result is a tidy data set with one variable per column and one observation of mean per subject per activity in each row.

### CodeBook.md
The CodeBook.md file describes each of the variables found in the tidy.txt data set.

### features_info.txt
The features_info.txt file is an original file from the UCI Android measurement data set[1].  This data set is used for all calculations and transformations of data in this project.  This file contains the description of how the original measurements were derived.

### features.txt
The features.txt file is an original file from the UCI Android measurement data set[1].  This data set is used for all calculations and transformations of data in this project.  This file contains list of all measurements that were originally contained within the test and training data sets.  This project only ends up using those measurements that take mean() or std() calculations.


[[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)