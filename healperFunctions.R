#take paths to our data files and merge them
getAndMergeData <- function(train.path,train.response,test.path,test.response,subject.train,subject.test){
    data <- read.table(train.path) %>% rbind(read.table(test.path)) 
    
    data <- data %>%  cbind(rbind(read.table(subject.train),read.table(subject.test))) %>% cbind(rbind(read.table(train.response),read.table(test.response)))
    names(data) <- seq(1:dim(data)[2])
    data 
}

#parse feature names to meaningful ones
get_meangful_feature_name <- function(element){
    splitted <- str_match_all(element, "([tf])((?:Body)|(?:Gravity))*([AccGyro]*)([Jerk]*)?([Mag]*)?")
    listElement<- splitted[[1]]
    if (listElement[2]=="t")
        name <- "Raw"
    else
        name <- "FFT"
    
    name <- paste(name,listElement[3],sep="_")
    
    if (listElement[4] == "Gyro")
        name <- paste(name,"gyroscope",sep="_")
    else
        name <- paste(name,"accelerometer",sep="_")
    
    if(listElement[5] == "Jerk")
        name <- paste(name,"JerkSignal",sep="_")
    
    if(listElement[6] == "Mag")
        name <- paste(name,"Magnitude",sep="_")
    name
}
#parse feature names to meaningful ones and check if a pattern exist in the name
getFeaturesNames <- function(ele,Pattern = NA){
    hasPattern <- TRUE
    if(ele[[7]] != "")
        name <- paste(ele[[7]],ele[[8]])
    else
        name <- paste(get_meangful_feature_name(ele[[3]]),ele[[4]],ele[[5]],sep="_")
    
    if(!is.na(Pattern))
        hasPattern <- ifelse(length(grep(Pattern,name))!=0,TRUE,FALSE)
    
    c(name,hasPattern)
}