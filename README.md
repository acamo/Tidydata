---
title: "README"
author: "AC"
date: "25/6/2020"
output: html_document
---

The dataset includes the following files:
=========================================

- 'README.md'
- 'CodeBook.md'
- 'run_analysis.R'

The script perform the preparation of a tidy data set based on some input files from the project Human Activity Recognition here described:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


The data sets above are partitioned into two main sets, training data and test data. The data are the same, they only represent different sets of data.

The 'run_analysis.R' script is based on a function ('createdf') that is called 2 times in order to prepare a unique DF collecting the required data. The function perform the following activities (note: for each table a unique id that identifies the measure has been created via sequence):
- Prepare a DF with the subjects that made the experiment and named properly the columns
- Prepare a DF with the activity done by the subject and named properly the column. The activity is defined as label and not as id to have a clearer understanding. Columns have been properly named
- Prepare a DF with the vector features associated to each measure. From the vector feature have been selected just the columns of mean and std deviation that have been reuired to create the tidy data set. Columns have been properly named leveraging field features description table
Then the above 3 DF have been merged in order to have the required data set.

After that the 'createdf' function have been called for training data set and then for test data set collection, the result have been merged to create the first tidy dataset contained test and training data. This file is written in a .txt named 'measurementstidy.txt'

Then starting from this data set a 'group by' activity and subject has been done in order to calculate the mean of the contained variables and the final dta set have been produced and written in a .txt file named 'measurebygrouptidy.txt'.

Finally, also the raw data sets have been merged via 'rawdatapreparation' function. Raw data sets for training and test measured are merged in a common DF and column are properly named