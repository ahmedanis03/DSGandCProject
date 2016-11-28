getAndMergeData <- function(train.path,train.response,test.path,test.response,subject.train,subject.test){
    data <- read.table(train.path) %>% rbind(read.table(test.path)) 
    
    data <- data %>%  cbind(rbind(read.table(subject.train),read.table(subject.test))) %>% cbind(rbind(read.table(train.response),read.table(test.response)))
    names(data) <- seq(1:dim(data)[2])
    data 
}