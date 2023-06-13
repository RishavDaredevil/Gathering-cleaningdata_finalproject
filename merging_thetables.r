library(data.table)
library(dplyr)
library(tidyr)
source(file = "fulltestfile.r")
source(file = "fulltrainfile.r")
mergedtable <- rbind(fulltrainfile,fulltestfile,use.names = FALSE)
subsetcols <- grep(pattern = ' [Ss]td | [Mm]ean |activity names|^subject',
                   names(mergedtable))
subsetted_mergedtable <- mergedtable[,..subsetcols]
subsetted_mergedtable <- subsetted_mergedtable %>% 
    group_by(`activity names`,`subject number`) %>% 
    summarise_all(mean)
names(subsetted_mergedtable)[-(1:2)] <- paste('summary of',
                                              names(subsetted_mergedtable)[-(1:2)])
subsetted_mergedtable$`activity names` <- as.factor(subsetted_mergedtable$`activity names`)
subsetted_mergedtable$`subject number` <- as.factor(subsetted_mergedtable$`subject number`)