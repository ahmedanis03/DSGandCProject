#functions in another file ("other fiels are just old version just check this file")
source('healperFunctions.R')
#-------------- Read Data
df <- getAndMergeData("UCI HAR Dataset/train/X_train.txt",
                      "UCI HAR Dataset/train/y_train.txt",
                      "UCI HAR Dataset/test/X_test.txt",
                      "UCI HAR Dataset/test/y_test.txt",
                      "UCI HAR Dataset/train/subject_train.txt",
                      "UCI HAR Dataset/test/subject_test.txt")

#--------------- Read Feature Names
feature_names <- read_lines("UCI HAR Dataset/features.txt")

#--------------- Parse, change feature names and find targeted features
splitted_names <- str_match_all(feature_names,"([0-9]{1,3}) (\\w*)-(\\w*\\(?\\)?)-?(.*)|([0-9]{1,3}) (\\w*)(.*)")
new_names <- t(sapply(splitted_names,getFeaturesNames,"mean|std"))

#--------------- Set New Names and filter features
new_names <- rbind(new_names,c("subject_ID","TRUE"),c("response","TRUE"))
names(df)<-new_names[,1]
filtered_df <- df[,as.logical(new_names[,2])]

#--------------- change response variable from factor to describtive string
labels_names <- read_lines("../UCI HAR Dataset/activity_labels.txt")
labeles_splitted <- strsplit(labels_names," ");
mapped_labels <- sapply(filtered_df$response,function(x){labeles_splitted[[grep(x,labeles_splitted)]][2]})
filtered_df <- filtered_df %>% mutate(response = mapped_labels)

#--------------- group by response and subject
by_act_sub = filtered_df %>% group_by(response,subject_ID)

#--------------- Create Summary
new_data <- summarise_each(by_act_sub,funs(mean))

#--------------- Save File

write.table(new_data,row.names = FALSE,"newData.csv")
write_lines(names(new_data),"newfeatures_names.txt")
