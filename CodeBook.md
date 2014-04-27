## CodeBook.md
### Data
The dataset is composed of the following files:
+ './dataset/features.txt': List of all features
+ './dataset/train/X_train.txt': Training set.
+ './dataset/test/X_test.txt': Test set.

The output of the script will be a file with the average of every feature for all the subjects part of the experiment. The name of the project is 'avg-data.txt' and will be on the output directory.

### Variables
+ meanstdData. This will contain the result for the first part of the project. It's a subset of all the features that have mean or standar deviation values.
+ meanData. This will contain the result for the second part of the project. It's a summary of all the observations; the set will contain a row with the mean of every feature , one row per subject.