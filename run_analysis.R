## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names.
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function(){
    
## Create one DF for training and test, each measure is linked to a sequence
## Write to a .txt file a tidy data set with the merging between train and test data
## Write to a .txt file a tidy data set that start from the merging and calculate the 
## mean by subject and activity for the variables mean and std deviation that have been 
## selected by the merging data set    
    createdf("train")
    createdf("test")
    measurementtot <- rbind(measurementtrain,measurementtest)
    measurementtot <- subset(measurementtot, select = -1)
    measurementtot <- cbind(seq(1,nrow(measurementtot)),measurementtot)
    colnames(measurementtot)[1] <- "measure"
    write.table(measurementtot,"measurementstidy.txt",row.names = FALSE)
    
    measurementtot <- subset(measurementtot, select = -1)
    measby <- measurementtot %>% group_by(activitylabel, subject) %>% summarize_all(mean)
    write.table(measby,"measurebygrouptidy.txt",row.names = FALSE)
    print("end")   
}

createdf <- function(dataset){

## Load activity table and features table    
    activitytable <- read.table("activity_labels.txt")
    colnames(activitytable) <- c("activitycode","activitylabel")
    featurestable <- read.table("features.txt")
    colnames(featurestable) <- c("number","attribute")
    
## Subject table preparation    
    subject <- read.table(paste0("./",dataset,"/subject_",dataset,".txt"))
    subject <- cbind(seq(1,nrow(subject)),subject)
    colnames(subject) <- c("measure","subject")

## Activity table preparation with label    
    activity <- read.table(paste0("./",dataset,"/y_",dataset,".txt"))
    activity <- cbind(seq(1,nrow(activity)),activity)
    colnames(activity) <- c("measure","activitycode")
    activity <- merge.data.frame(activity,activitytable)
    activity <- subset(activity, select = -c(activitycode))
    colnames(activity) <- c("measure","activitylabel")

##  Features table preparation
    features <- read.table(paste0("./",dataset,"/x_",dataset,".txt"))
    features <- cbind(seq(1,nrow(features)),features)
    colnames(features) <- c("measure", featurestable$attribute)
    selectmeanstd <- grep ("mean\\(|std\\(",featurestable$attribute,value=TRUE)
    features <- subset(features, select = c("measure",selectmeanstd))
    namescol <- names(features)
    namescol <- gsub("\\(\\)","",namescol)
    namescol <- gsub("-","",namescol)
    colnames(features) <- tolower(namescol)

## Create DF for subject, activity and mean and std deviation for all the measurements
    measurement <- merge(merge(subject,activity),features)
    assign(paste0("measurement", dataset), measurement, pos = 1)
}


## Raw data table preparation, changing variable names with the 128 window measure
## Eliminated "_" and ".txt" from file name and given to DF the same name of the file with "df at the beginning   
rawdatapreparation <- function() {
    filenamestrain <- dir("./train/Inertial Signals")
    filenamestest <- dir("./test/Inertial Signals")
    for (k in 1:128) {
        columnwindow[k]<- paste0("window",k)
    }
    for (i in 1:9) {
        dftemptrain <- read.table(paste0("train/Inertial Signals/",filenamestrain[i]))
        dftemptest <- read.table(paste0("test/Inertial Signals/",filenamestest[i]))
        dftemp <- rbind(dftemptrain,dftemptest)
        dftemp <- cbind(seq(1,nrow(dftemp)),dftemp)
        colnames(dftemp) <- c("measure",columnwindow)
        dfname <- gsub("_","",filenamestrain[i])
        dfname <- sub("train.txt","",dfname)
        dfname <- paste0("tot",dfname)
        write.table(dftemp,paste0(dfname,".txt"),row.names = FALSE)
    }
}