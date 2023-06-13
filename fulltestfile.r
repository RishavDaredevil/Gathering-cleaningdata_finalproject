testfile <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/test/X_test.txt')
featuresnames <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/features.txt')
testfileactivity <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/test/y_test.txt')
activitynames <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/activity_labels.txt')
testfilesubject <- fread('C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/UCI HAR Dataset/test/subject_test.txt')
testfileactivity <- left_join(testfileactivity,activitynames,by = 'V1')[[2]]
fulltestfile <- cbind(testfile,'activity names' = testfileactivity,
                      'subject number' =  testfilesubject)
names(fulltestfile)[1:561] <- featuresnames[[2]]
names(fulltestfile) <- gsub(pattern = '-',x = names(fulltestfile),replacement = ' ')
names(fulltestfile) <- gsub(pattern = '[()][()]',x = names(fulltestfile),replacement = '')
names(fulltestfile) <- gsub(pattern = '  ',x = names(fulltestfile),replacement = ' ')
names(fulltestfile)[563] <- 'subject number'
