---
title: "CodeBook"
author: "AC"
date: "25/6/2020"
output: html_document
---

This codebook decribed the variables included in the final tidy data set 'measurebygrouptidy.txt'. Each record represent a measure with the following variables:

Activity Label
Identifies the activity performed by each one of the subject doing the experiment. Can assume one of the following values (characters): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Subject 
Identifies the subject that perform the experiment. Each subject is identified by a number between 1 and 30

Will follows a subset of 561 vector with features. From this vector have been selected just the mean and standard deviation features that are 66 variables. these variables have been grouped by activity and subject and calculated the mean. The 66 variables features are here listed, normalized and bounded within [-1,1]

"tbodyaccmeanx"
Mean of the body acceleration X axial raw signal

"tbodyaccmeany"
Mean of the body acceleration Y axial raw signal

"tbodyaccmeanz"
Mean of the body acceleration Z axial raw signal

"tbodyaccstdx"
Standard deviation of the body acceleration X axial raw signal

"tbodyaccstdy"
Standard deviation of the body acceleration Y axial raw signal

"tbodyaccstdz" 
Standard deviation of the body acceleration Z axial raw signal

"tgravityaccmeanx"
Mean of the gravity acceleration X axial raw signal

"tgravityaccmeany"
Mean of the gravity acceleration Y axial raw signal

"tgravityaccmeanz"
Mean of the gravity acceleration Z axial raw signal

"tgravityaccstdx"
Standard deviation of the gravity acceleration X axial raw signal

"tgravityaccstdy"
Standard deviation of the gravity acceleration Y axial raw signal

"tgravityaccstdz" 
Standard deviation of the gravity acceleration Z axial raw signal

 "tbodyaccjerkmeanx" "tbodyaccjerkmeany" "tbodyaccjerkmeanz" "tbodyaccjerkstdx" "tbodyaccjerkstdy" "tbodyaccjerkstdz"
 Same as above for Jerk signal
 
 "tbodygyromeanx" "tbodygyromeany" "tbodygyromeanz" "tbodygyrostdx" "tbodygyrostdy" "tbodygyrostdz"
 Same as above measurements from acceleration but from gyroscope
 
 "tbodygyrojerkmeanx" "tbodygyrojerkmeany" "tbodygyrojerkmeanz" "tbodygyrojerkstdx" "tbodygyrojerkstdy" "tbodygyrojerkstdz" 
 Same as above gyroscope acceleration Jerk signal
 
 "tbodyaccmagmean" "tbodyaccmagstd" "tgravityaccmagmean" "tgravityaccmagstd" "tbodyaccjerkmagmean" "tbodyaccjerkmagstd" "tbodygyromagmean" "tbodygyromagstd" "tbodygyrojerkmagmean" "tbodygyrojerkmagstd"
Three-dimensional signals  calculated using the Euclidean norm
 
 
 "fbodyaccmeanx" "fbodyaccmeany" "fbodyaccmeanz" "fbodyaccstdx" "fbodyaccstdy" "fbodyaccstdz" "fbodyaccjerkmeanx" "fbodyaccjerkmeany" "fbodyaccjerkmeanz" "fbodyaccjerkstdx" "fbodyaccjerkstdy" "fbodyaccjerkstdz" "fbodygyromeanx" "fbodygyromeany" "fbodygyromeanz" "fbodygyrostdx" "fbodygyrostdy" "fbodygyrostdz" "fbodyaccmagmean" "fbodyaccmagstd" "fbodybodyaccjerkmagmean" "fbodybodyaccjerkmagstd" "fbodybodygyromagmean" "fbodybodygyromagstd" "fbodybodygyrojerkmagmean" "fbodybodygyrojerkmagstd"
Same measurements with Fast Fourier transfromation
