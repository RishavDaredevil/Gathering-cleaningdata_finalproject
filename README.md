# Gathering&cleaningdata_finalproject
 Coursera Project
The Codebook has been provided in 3 formats for ease. It explains all the variables present 
in the final dataset
**There are 3 R scripts provided that do the analysis please make them available in a common directory
before using them to test the analysis 
The readme file explains the working of the Rscripts 

The following steps are performed by the code in the R script fulltestfile - 

Reading the test dataset (X_test.txt) into the testfile data frame using the fread function.
Reading the feature names from features.txt into the featuresnames data frame.
Reading the activity labels for the test dataset (y_test.txt) into the testfileactivity data frame.
Reading the activity labels from activity_labels.txt into the activitynames data frame.
Reading the subject IDs for the test dataset (subject_test.txt) into the testfilesubject data frame.
Performing a left join on testfileactivity and activitynames to get descriptive activity names and storing the result in testfileactivity.
Creating the fulltestfile data frame by combining testfile, testfileactivity, and testfilesubject using cbind.
Assigning the feature names from featuresnames to the column names of fulltestfile.
Cleaning the column names of fulltestfile by removing hyphens, double parentheses, and excess spaces.
Renaming the last column of fulltestfile to "subject number".

The following steps are performed by the code in the R script fulltrainfile -

Reading the train dataset (X_train.txt) into the trainfile data frame using the fread function.
Reading the feature names from features.txt into the featuresnames data frame (overwriting the previous featuresnames variable).
Reading the activity labels for the train dataset (y_train.txt) into the trainfileactivity data frame.
Reading the activity labels from activity_labels.txt into the activitynames data frame (overwriting the previous activitynames variable).
Reading the subject IDs for the train dataset (subject_train.txt) into the trainfilesubject data frame.
Performing a left join on trainfileactivity and activitynames to get descriptive activity names and storing the result in trainfileactivity.
Creating the fulltrainfile data frame by combining trainfile, trainfileactivity, and trainfilesubject using cbind.
Assigning the feature names from featuresnames to the column names of fulltrainfile.
Cleaning the column names of fulltrainfile by removing hyphens, double parentheses, and excess spaces.
Renaming the last column of fulltrainfile to "subject number".

The following steps are performed by the code in the R script merging_thetables - 

Sourcing the file fulltestfile.r, which presumably contains additional code or functions related to fulltestfile.
Sourcing the file fulltrainfile.r, which presumably contains additional code or functions related to fulltrainfile.
Merging the fulltrainfile and fulltestfile data frames into the mergedtable data frame using rbind.
Selecting the columns from mergedtable that contain "std", "mean", "activity names", or "subject" using grep and storing the result in subsetcols.
Creating the subsetted_mergedtable data frame by subsetting mergedtable using the columns specified in subsetcols.
Grouping subsetted_mergedtable by "activity names" and "subject number".
Calculating the mean for all the remaining columns in subsetted_mergedtable within each group (activity and subject) using summarise_all.
Renaming the columns in subsetted_mergedtable (except the first two) by adding the prefix "summary of".
The result is a subset of the final merged and summarized data stored in subsetted_mergedtable, displaying the mean values grouped by "activity names" and "subject number" for selected columns.