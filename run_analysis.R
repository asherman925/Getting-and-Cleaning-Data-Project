## Note that this script assumes the plyr and reshape2 packages are installed

## Project point 1:Merges the training and the test sets to create one data set.st
## Read in Test Data
subject_test <-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/test/subject_test.txt");
X_test<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/test/X_test.txt");
y_test<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/test/y_test.txt");

## Read in Training data
subject_train <-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/train/subject_train.txt");
X_train<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/train/X_train.txt");
y_train<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/train/y_train.txt");

## Merges the Training and Test data sets into one data set
## And adds the feature descriptions of the measurements to the corresponding columns
features<-read.table(file="/Users/andytracy/GitHub/CourseraDataScience/Getting & Cleaning Data/UCI Har Dataset/features.txt", colClasses = "character");
subjects_data<-rbind(subject_test,subject_train);
y_data<-rbind(y_test,y_train);
X_data<-rbind(X_test,X_train);
names(X_data)<-as.list(features[,2]);
new_raw_set <-cbind(subjects_data,y_data,X_data);

## Project point 2:Extracts only the measurements on the mean and standard deviation for each measurement. 
## Creating a new set that just has the mean() and std() measurements from the X_test and X_train data
## Column points were derived from the features.txt data
mean_std_set<- new_raw_set[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)];

## Project point 3:Uses descriptive activity names to name the activities in the data set
## Replacing second column (activity code) with column describing the activity
mean_std_set$V1.1[mean_std_set$V1.1==1] <- "WALKING";
mean_std_set$V1.1[mean_std_set$V1.1==2] <- "WALKING_UPSTAIRS";
mean_std_set$V1.1[mean_std_set$V1.1==3] <- "WALKING_DOWNSTAIRS";
mean_std_set$V1.1[mean_std_set$V1.1==4] <- "SITTING";
mean_std_set$V1.1[mean_std_set$V1.1==5] <- "STANDING";
mean_std_set$V1.1[mean_std_set$V1.1==6] <- "LAYING";

## Project point 4:Appropriately labels the data set with descriptive variable names. 
## Naming & renaming rows to improve clarity
names(mean_std_set)<-gsub("tBody", "Time.Body.", names(mean_std_set));
names(mean_std_set)<-gsub("tGravity", "Time.Gravity.", names(mean_std_set));
names(mean_std_set)<-gsub("fBody", "Frequency.Body.", names(mean_std_set));
names(mean_std_set)<-gsub("fBody", "Frequency.Body.", names(mean_std_set));
names(mean_std_set)<-gsub("Acc", "Accelerometer", names(mean_std_set));
names(mean_std_set)<-gsub("Gyro", "Gyroscope", names(mean_std_set));
names(mean_std_set)[1]<-"Subject";
names(mean_std_set)[2]<-"Activity";

## Project point 5: Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 
var_cols<-names(mean_std_set)[c(3:68)];
melt_mean_std_set <-melt(mean_std_set, id=c("Subject", "Activity"), measure.vars=var_cols);
tidy<-dcast(melt_mean_std_set, Subject + Activity ~ variable, mean);