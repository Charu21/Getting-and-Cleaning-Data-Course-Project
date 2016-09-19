# Step 1

## Merges the training and the test sets to create one data set.
rm(list = ls()) #clear workspace

setwd("C:\\Users\\Charusmita1\\Downloads\\Documents\\UCI HAR Dataset") # get proper path

activityLabels <- read.table("activity_labels.txt") 
 
activityLabels[,2] <- as.character(activityLabels[,2])

features <- read.table("features.txt")
 
features[,2] <- as.character(features[,2])

# training data
xTrain = read.table('./train/x_train.txt',header=FALSE); 
yTrain = read.table('./train/y_train.txt',header=FALSE);
subjecTrain <- read.table('./train/subject_train.txt',header = FALSE)

#test data
xtest <- read.table('./test/X_test.txt')
 
ytest <- read.table('./test/y_test.txt')
 
subjecTest <- read.table('./test/subject_test.txt')

# create merged data set
xData <- rbind(xTrain, xtest)

yData <- rbind(yTrain, ytest)

subjecData <- rbind(subjecTrain, subjecTest)

# Step 2

##Extracts only the measurements of the mean and standard deviation for each measurement

requiredFeature <- grep(".*(mean|std)\\(\\)",features[,2])
xData <- xData[,requiredFeature]

# correcting the column names

names(xData) <- features[requiredFeature, 2]

yData[,1] <- activityLabels[yData[,1],2] 
names(yData) <- "activity"

names(subjecData) <- "subject"
allData <- cbind(xData, yData, subjecData)

# Step 3

##Use descriptive activity names to name the activities in the data set

colNames = colnames(allData); 

 for (i in 1:length(colNames)) 
 {
         
    colNames[i] = gsub("\\()","",colNames[i])
       
    colNames[i] = gsub("-std$","StandardDeviation",colNames[i])
             
    colNames[i] = gsub("-mean","Mean",colNames[i])
               
    colNames[i] = gsub("^(t)","Time",colNames[i])
               
    colNames[i] = gsub("^(f)","Frequency",colNames[i])
                   
    colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
                     
    colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
                       
    colNames[i] = gsub("[Gg]yro","Gyrometer",colNames[i])
                         
    colNames[i] = gsub("AccMag","AccelerometerMagnitude",colNames[i])
                           
    colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccelJerkMagnitude",colNames[i])
                             
    colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
                               
    colNames[i] = gsub("GyroMag","GyrometerMagnitude",colNames[i])
                                 
 };

# Step 4

## Appropriately labels the data set with descriptive variable names
  colnames(allData) = colNames
  #View(allData)

# Step 5

## Create a second, independent tidy data set with the average of each variable
# for each activity and each subject


tidyData = aggregate(allData[,names(allData) != c('activity','subject')],by=list(activity = allData$activity,subject = allData$subject),mean);

write.table(tidyData, "tidy_data.txt", row.name=FALSE,sep='\t')

View(tidyData)



