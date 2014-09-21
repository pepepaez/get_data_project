# CODEBOOK

## Script functions
The following describes the steps followed on each script

run_analysis.R	
	Steps:
	
		1 - Load data and required packages
		1.1 - Load packages that will be used (plyr, reshape2)
		1.2 - Source additional scripts (clean_names.R)
		1.3 - Load feature names (called measurement labels in the script), 
		      this will help identifying those measurements for mean and 
		      standard deviation
		1.4 - Load activity labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
		      SITTING, STANDING, LAYING) to assign them to the final output
		      for readibility
		1.5 - Load test and train data on individual variables

		2 - Identify measurements we need to extract
		2.1 - Assign measurement labels to each column
		2.2 - Use a regular expression to identify the columns for mean 
		      and standard deviation

		3 - Combine train and test data sets to create a single data set
		3.1 - Bind train and test data sets individually (subject, label and 
		      measurements) by combining all columns as we have the same number
		      of records for each data set
		3.2 - Bind the combined train and test data sets by appending the rows
		      from each set

		4 - Transform data set to calculate mean for each measurement
		4.1 - Melt to transform each measurement column into a record for each 
		      activity for each subject
		4.2 - With each measurement as a row we calculate the mean by using ddply
		      for each activity for each subject
		4.3 - Include the name for each activity id with the data set loaded in 
		      step 1.4

		5 - Reorder and clean up data names
		5.1 - After step 4.3 the data set has columns in the wrong order, we
		      reorder the columns in the same data set and sort the data
		      by subject, activity and measurement label
		5.2 - Call script clean_names.R to change the labels for each measurement
		      and make them more descriptive (see transformation steps below)

		6 - Write final data set to output_analysis.txt

clean_names.R
	Steps:
	
		1 - Creates a simple data frame that includes the patterns to recognize
		    in each label as well as the replacement value
		2 - Using a loop performs the following changes:
			Replaces prefix 't' and 'f' with 'time' and 'frequency'
			Replaces 'Acc' with 'acceleration'
			Replaces 'Gyro' with 'gyroscope'
			Removes all parentheses and replaces blank spaces with underscores ('_')
		3 - Converts all labels to lowercase

## Data Dictionary

SUBJECT_ID
	Size: 1
	Type: numeric
	Description: ID for each of the subjects in the experiment
	Range: 1 - 30

ACTIVITY_ID
	Size: 1
	Type: numeric
	Description: ID for each activity performed by each subject, see ACTIVITY_NAME for description of activity
	Range: 1 - 6

ACTIVITY_NAME
	Size: 6 - 18
	Type: alphabetic
	Description: Descriptive name of the activity performed by each subject
	Values: 
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

VARIABLE
	Size: 20 - 52
	Type: alphabetic
	Description: Name of the variable measured for each activity performed by each subject, see value transformation in
	original_names.txt file
	Values:
		time_body_acceleration_mean_on_x
		time_body_acceleration_mean_on_y
		time_body_acceleration_mean_on_z
		time_body_acceleration_std_dev_on_x
		time_body_acceleration_std_dev_on_y
		time_body_acceleration_std_dev_on_z
		time_gravity_acceleration_mean_on_x
		time_gravity_acceleration_mean_on_y
		time_gravity_acceleration_mean_on_z
		time_gravity_acceleration_std_dev_on_x
		time_gravity_acceleration_std_dev_on_y
		time_gravity_acceleration_std_dev_on_z
		time_body_acceleration_jerk_mean_on_x
		time_body_acceleration_jerk_mean_on_y
		time_body_acceleration_jerk_mean_on_z
		time_body_acceleration_jerk_std_dev_on_x
		time_body_acceleration_jerk_std_dev_on_y
		time_body_acceleration_jerk_std_dev_on_z
		time_body_gyroscope_mean_on_x
		time_body_gyroscope_mean_on_y
		time_body_gyroscope_mean_on_z
		time_body_gyroscope_std_dev_on_x
		time_body_gyroscope_std_dev_on_y
		time_body_gyroscope_std_dev_on_z
		time_body_gyroscope_jerk_mean_on_x
		time_body_gyroscope_jerk_mean_on_y
		time_body_gyroscope_jerk_mean_on_z
		time_body_gyroscope_jerk_std_dev_on_x
		time_body_gyroscope_jerk_std_dev_on_y
		time_body_gyroscope_jerk_std_dev_on_z
		time_body_acceleration_magnitude_mean
		time_body_acceleration_magnitude_std_dev
		time_gravity_acceleration_magnitude_mean
		time_gravity_acceleration_magnitude_std_dev
		time_body_acceleration_jerk_magnitude_mean
		time_body_acceleration_jerk_magnitude_std_dev
		time_body_gyroscope_magnitude_mean
		time_body_gyroscope_magnitude_std_dev
		time_body_gyroscope_jerk_magnitude_mean
		time_body_gyroscope_jerk_magnitude_std_dev
		frequency_body_acceleration_mean_on_x
		frequency_body_acceleration_mean_on_y
		frequency_body_acceleration_mean_on_z
		frequency_body_acceleration_std_dev_on_x
		frequency_body_acceleration_std_dev_on_y
		frequency_body_acceleration_std_dev_on_z
		frequency_body_acceleration_mean_freq_on_x
		frequency_body_acceleration_mean_freq_on_y
		frequency_body_acceleration_mean_freq_on_z
		frequency_body_acceleration_jerk_mean_on_x
		frequency_body_acceleration_jerk_mean_on_y
		frequency_body_acceleration_jerk_mean_on_z
		frequency_body_acceleration_jerk_std_dev_on_x
		frequency_body_acceleration_jerk_std_dev_on_y
		frequency_body_acceleration_jerk_std_dev_on_z
		frequency_body_acceleration_jerk_mean_freq_on_x
		frequency_body_acceleration_jerk_mean_freq_on_y
		frequency_body_acceleration_jerk_mean_freq_on_z
		frequency_body_gyroscope_mean_on_x
		frequency_body_gyroscope_mean_on_y
		frequency_body_gyroscope_mean_on_z
		frequency_body_gyroscope_std_dev_on_x
		frequency_body_gyroscope_std_dev_on_y
		frequency_body_gyroscope_std_dev_on_z
		frequency_body_gyroscope_mean_freq_on_x
		frequency_body_gyroscope_mean_freq_on_y
		frequency_body_gyroscope_mean_freq_on_z
		frequency_body_acceleration_magnitude_mean
		frequency_body_acceleration_magnitude_std_dev
		frequency_body_acceleration_magnitude_mean_freq
		frequency_body_acceleration_jerk_magnitude_mean
		frequency_body_acceleration_jerk_magnitude_std_dev
		frequency_body_acceleration_jerk_magnitude_mean_freq
		frequency_body_gyroscope_magnitude_mean
		frequency_body_gyroscope_magnitude_std_dev
		frequency_body_gyroscope_magnitude_mean_freq
		frequency_body_gyroscope_jerk_magnitude_mean
		frequency_body_gyroscope_jerk_magnitude_std_dev
		frequency_body_gyroscope_jerk_magnitude_mean_freq
		angle_time body_acceleration_mean_gravity_
		angle_time body_acceleration_jerk_mean_gravity_mean
		angle_time body_gyroscope_mean_gravity_mean
		angle_time body_gyroscope_jerk_mean_gravity_mean
		angle_x_gravity_mean
		angle_y_gravity_mean
		angle_z_gravity_mean

MEAN
	Type: numeric
	Description: Calculated mean for each of the variables measured for each activity performed by each subject
	 
