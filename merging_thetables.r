source(file = "C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/fulltestfile.r")
source(file = "C:/Users/Risha/Desktop/R_course/Gathering&Cleaning_data/final_project/fulltrainfile.r")
mergedtable <- rbind(fulltrainfile,fulltestfile,use.names = FALSE)
subsetcols <- grep(pattern = ' [Ss]td | [Mm]ean |activity names|^subject',
                   names(mergedtable))
subsetted_mergedtable <- mergedtable[,..subsetcols]
subsetted_mergedtable <- subsetted_mergedtable %>% 
    group_by(`activity names`,`subject number`) %>% 
    summarise_all(mean)
names(subsetted_mergedtable)[-(1:2)] <- paste('summary of',
                                              names(subsetted_mergedtable)[-(1:2)])

