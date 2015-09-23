# gettingCleanData
Getting Clean Data John Hopkins Course

run_analysis.R
===============

 This code fist unpacks the numeric data combining it with the subjects and activity data. This
is done for both Training and Test data before they are combined.

## Names on columns
Here the variable names (from features) are added.

This larger data set (line 54) is then cropped to only contain mean() and std() columns

Finally data is split by subject before collective means for each variable are calculated 
doe each of the six activities.

The data is saved to a text file called "tableOfMeans.txt".