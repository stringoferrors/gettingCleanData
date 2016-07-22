##Getting Clean Data Project

WD <- getwd()


## Training data
filePath <- paste(WD,"/UCI HAR Dataset/train", sep="", collapse=NULL)
setwd(filePath)
X_train.txt <- read.table("X_train.txt")
subjects_train <- read.table("subject_train.txt")
y_train.txt <- read.table("y_train.txt")

## Test data
filePath2 <- paste(WD,"/UCI HAR Dataset/test", sep="", collapse=NULL)
setwd(filePath2)
X_test.txt <- read.table("X_test.txt")
subjects_test <- read.table("subject_test.txt")
y_test.txt <- read.table("y_test.txt")

## Names on columns
filePath3 <- paste(WD,"/UCI HAR Dataset", sep="", collapse=NULL)
setwd(filePath3)
#getwd()
names_df <- read.table("features.txt")
##Combine and name X
combined_X <- rbind(X_train.txt, X_test.txt)

names(combined_X) <- names_df$V2
##Combine and name y
combined_y <- rbind(y_train.txt, y_test.txt)
names(combined_y) <- "Activity"
##Combine and name sub
combined_subject <- rbind(subjects_train, subjects_test)
names(combined_subject) <- "Subject"

#bind together columns                          
df.finished <- cbind(combined_subject, combined_y, combined_X)

# Activity stuff?
activity_names_df <- read.table("activity_labels.txt")

#switch the values
for(i in 1:6){
  df.finished$Activity <- gsub(pattern=activity_names_df$V1[i],
                               activity_names_df$V2[i], df.finished$Activity)}

##select only the measurements on the mean and standard deviation measurements

meanStdIndex <- grep(pattern="mean()|std()", names(df.finished))
ColIndex <- c(1, 2, meanStdIndex)
df.final <- df.finished[, ColIndex]
##View(df.final)
#write.table(df.final, "df.csv", sep=",")

### Produce the mean of means table

AA <- split(df.final, df.final$Subject)
GG <- c()
for (i in 1:30){
  
  test.df <- AA[[i]]
  CC <- by(test.df[, 3:length(test.df)], test.df$Activity, colMeans)
  DD <- do.call(rbind, CC)
  FF <- cbind(Subject=i, Activity=row.names(DD),DD)
  row.names(FF) <- NULL
  GG <- rbind(GG, FF)
}
df.means <- as.data.frame(GG)
View(df.means)
setwd("..")
write.table(df.means, file="tableOfMeans.txt", row.names=FALSE)