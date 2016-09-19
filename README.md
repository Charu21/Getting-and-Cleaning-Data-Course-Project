# Getting-and-Cleaning-Data-Course-Project

##Outline
This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis. A full description of the data used in this project can be found at The UCI Machine Learning Repository

##Raw data
The features (561 of them) are unlabeled and can be found in the xtest.txt. The activity labels are in the ytest.txt file. The test subjects are in the subject_test.txt file.The same holds for the training set.

##Script analysis
The main script run_analysis.R does the following  
1) The data set is downloaded and kept such that the data set files can be directly accessed from the working directory .
2) All the similar data is merged using the rbind() function. We are merging the testing and training sets together.
3) Then, only those columns (requiredFeatures) with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given descriptive names.
4) Next, we generate a new dataset with all the average measures for each subject and activity type (30*6=180). 
5) Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy_data.txt, which can also be found in this repository.

#NOTE : You can find additional information about the variables, data and transformations in the codebook.md file.
