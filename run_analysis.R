# Peer Assingment. Getting and Cleaning Data
# FIRST. TIDY SUBSET of DATA (MEAN and STD)
# Load train set
trainData <- read.table("./dataset/train/X_train.txt")

# Load test set
testData <- read.table("./dataset/test/X_test.txt")

# Merge the training and the test sets to create one data set
allData <- rbind(trainData,testData)

# Load features.txt to obtain all the columns that are mean or
# standard deviation from the different variables
featuresTable <- read.table("./dataset/features.txt")
features <- featuresTable$V2

# Extract only the measurements on the mean and standard deviation for each measurement
tempFeatures <- lapply(c("mean()","std()"),grep,features,fixed=TRUE)
meanstdCols <- sort(c(tempFeatures[[1]],tempFeatures[[2]]))
meanstdData <- allData[,meanstdCols]

# Label the data set with descriptive activity names
names(meanstdData) <- features[meanstdCols]

#SECOND. TIDY SET, AVERAGE FOR EACH ACTIVITY AND SUBJECT
# Name allData variables properly
names(allData) <- features
# Load the subject for each row
subjectsTrain <- readLines("./dataset/train/subject_train.txt")
subjectsTest <- readLines("./dataset/test/subject_test.txt")

subjects <- as.numeric(c(subjectsTrain,subjectsTest))

# Build the mean table
meanData <- data.frame(matrix(nrow=length(unique(subjects)),ncol=length(features)+1))

for (i in 1:length(features)) {
  meanData[,i+1] <- tapply(allData[,i],as.numeric(subjects),mean)
}

# Set subjects
names(meanData) <- c("subject",as.vector(features))

# Write a file with the avg data
write.table(meanData,file="./output/avg-data.txt")




