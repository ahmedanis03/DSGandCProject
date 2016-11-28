df <- getAndMergeData("../UCI HAR Dataset/train/X_train.txt",
                     "../UCI HAR Dataset/train/y_train.txt",
                     "../UCI HAR Dataset/test/X_test.txt",
                     "../UCI HAR Dataset/test/y_test.txt",
                     "../UCI HAR Dataset/train/subject_train.txt",
                     "../UCI HAR Dataset/test/subject_test.txt")
#---------------------------------------------

fea_names <- read_lines("../UCI HAR Dataset/features.txt")
names_transf <- gsub("([0-9]{1,3}) (\\w*)-(\\w*\\(?\\)?)[^a-zA-Z0-9]*(\\w*)","\\1-\\2-\\3-\\4",fea_names) 
names_transf <- gsub("([0-9]{1,3}) (\\w*)(\\(.*\\))","\\1-\\2-\\3",names_transf)


#---------------------------------------------asdf-----
names(df) <- c(names_transf,"subject_ID","response")
df<- tbl_df(df)
measure_names = gsub(".*-(.*\\(\\))-.*","\\1",names(df))
target_columns = measure_names %in% c("mean()","std()","response","subject_ID");
df_f <- df[,target_columns]

# --------------------------------------------------
labels_names <- read_lines("../UCI HAR Dataset/activity_labels.txt")
labeles_splitted <- strsplit(labels_names," ");
mapped_labels <- sapply(df_f$response,function(x){labeles_splitted[[grep(x,labeles_splitted)]][2]})
df_f <- df_f %>% mutate(response = mapped_labels)
#--------------
parsed_names <- str_match_all(names(df_f), "[0-9]{1,3}-([tf])((?:Body)|(?:Gravity))*([AccGyro]*)([Jerk]*)?([Mag]*)?-(.*)-(.*)")

set_meangful_names <- function(listElement){
    if(is.na(listElement[1]))
        return("")
    if (listElement[[2]]=="t")
        name <- "Row_"
    else
        name <- "FFT_"
    name <- paste(name,listElement[[3]])
    
    if (listElement[[4]] == "Gyro")
        name <- paste(name,"gyroscope",sep="_")
    else
        name <- paste(name,"accelerometer",sep="_")
    
    if(listElement[[5]] == "Jerk")
        name <- paste(name,"JerkSignal",sep="_")
    
    if(listElement[[6]] == "Mag")
        name <- paste(name,"Magnitude",sep="_")
    if(listElement[[7]] != "")
        name <- paste(name,listElement[[7]],sep="_")
    if(listElement[[8]] != "")
        name <- paste(name,listElement[[8]],sep="_")
    name
}
new_names <- sapply(parsed_names,set_meangful_names)
new_names[c(length(names(df_f))-1,length(names(df_f)))] <- c("subject_ID","response")
names(df_f) <- new_names
# ----------- 
by_activity = df_f %>% group_by(response,subject_ID)
new_data <- summarise_each(by_activity,funs(mean))