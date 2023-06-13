trainfile <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/train/X_train.txt')
featuresnames <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/features.txt')
trainfileactivity <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/train/y_train.txt')
activitynames <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/activity_labels.txt')
trainfilesubject <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/train/subject_train.txt')
trainfileactivity <- left_join(trainfileactivity,activitynames,by = 'V1')[[2]]
fulltrainfile <- cbind(trainfile,'activity names' = trainfileactivity,
                      'subject number' =  trainfilesubject)
names(fulltrainfile)[1:561] <- featuresnames[[2]]
names(fulltrainfile) <- gsub(pattern = '-',x = names(fulltrainfile),replacement = ' ')
names(fulltrainfile) <- gsub(pattern = '[()][()]',x = names(fulltrainfile),replacement = '')
names(fulltrainfile) <- gsub(pattern = '  ',x = names(fulltrainfile),replacement = ' ')
names(fulltrainfile)[563] <- 'subject number'
