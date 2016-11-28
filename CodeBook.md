# Features for new data
## Features Description

Every _ split something meaningful for the data so lets check the possible values

1. Raw (Original) Or FFT (Fast Fourier Transform)
2. Body Or Gravity Measure
3. measure source: accelerometer or gyroscope
4. summary function applied: mean or std
5. Is Jerk Signal? 
6. Is Magnitude?
7. dimention: X,Y,Z (if exist)

First two features are the grouping ones: 

1. respone: represent the grouping Activity
2. subject_ID: represent each subject

```
response

subject_ID

Raw_Body_accelerometer_mean()_X

Raw_Body_accelerometer_mean()_Y

Raw_Body_accelerometer_mean()_Z

Raw_Body_accelerometer_std()_X

Raw_Body_accelerometer_std()_Y

Raw_Body_accelerometer_std()_Z

Raw_Gravity_accelerometer_mean()_X

Raw_Gravity_accelerometer_mean()_Y

Raw_Gravity_accelerometer_mean()_Z

Raw_Gravity_accelerometer_std()_X

Raw_Gravity_accelerometer_std()_Y

Raw_Gravity_accelerometer_std()_Z

Raw_Body_accelerometer_JerkSignal_mean()_X

Raw_Body_accelerometer_JerkSignal_mean()_Y

Raw_Body_accelerometer_JerkSignal_mean()_Z

Raw_Body_accelerometer_JerkSignal_std()_X

Raw_Body_accelerometer_JerkSignal_std()_Y

Raw_Body_accelerometer_JerkSignal_std()_Z

Raw_Body_gyroscope_mean()_X

Raw_Body_gyroscope_mean()_Y

Raw_Body_gyroscope_mean()_Z

Raw_Body_gyroscope_std()_X

Raw_Body_gyroscope_std()_Y

Raw_Body_gyroscope_std()_Z

Raw_Body_gyroscope_JerkSignal_mean()_X

Raw_Body_gyroscope_JerkSignal_mean()_Y

Raw_Body_gyroscope_JerkSignal_mean()_Z

Raw_Body_gyroscope_JerkSignal_std()_X

Raw_Body_gyroscope_JerkSignal_std()_Y

Raw_Body_gyroscope_JerkSignal_std()_Z

Raw_Body_accelerometer_Magnitude_mean()_

Raw_Body_accelerometer_Magnitude_std()_

Raw_Gravity_accelerometer_Magnitude_mean()_

Raw_Gravity_accelerometer_Magnitude_std()_

Raw_Body_accelerometer_JerkSignal_Magnitude_mean()_

Raw_Body_accelerometer_JerkSignal_Magnitude_std()_

Raw_Body_gyroscope_Magnitude_mean()_

Raw_Body_gyroscope_Magnitude_std()_

Raw_Body_gyroscope_JerkSignal_Magnitude_mean()_

Raw_Body_gyroscope_JerkSignal_Magnitude_std()_

FFT_Body_accelerometer_mean()_X

FFT_Body_accelerometer_mean()_Y

FFT_Body_accelerometer_mean()_Z

FFT_Body_accelerometer_std()_X

FFT_Body_accelerometer_std()_Y

FFT_Body_accelerometer_std()_Z

FFT_Body_accelerometer_meanFreq()_X

FFT_Body_accelerometer_meanFreq()_Y

FFT_Body_accelerometer_meanFreq()_Z

FFT_Body_accelerometer_JerkSignal_mean()_X

FFT_Body_accelerometer_JerkSignal_mean()_Y

FFT_Body_accelerometer_JerkSignal_mean()_Z

FFT_Body_accelerometer_JerkSignal_std()_X

FFT_Body_accelerometer_JerkSignal_std()_Y

FFT_Body_accelerometer_JerkSignal_std()_Z

FFT_Body_accelerometer_JerkSignal_meanFreq()_X

FFT_Body_accelerometer_JerkSignal_meanFreq()_Y

FFT_Body_accelerometer_JerkSignal_meanFreq()_Z

FFT_Body_gyroscope_mean()_X

FFT_Body_gyroscope_mean()_Y

FFT_Body_gyroscope_mean()_Z

FFT_Body_gyroscope_std()_X

FFT_Body_gyroscope_std()_Y

FFT_Body_gyroscope_std()_Z

FFT_Body_gyroscope_meanFreq()_X

FFT_Body_gyroscope_meanFreq()_Y

FFT_Body_gyroscope_meanFreq()_Z

FFT_Body_accelerometer_Magnitude_mean()_

FFT_Body_accelerometer_Magnitude_std()_

FFT_Body_accelerometer_Magnitude_meanFreq()_

FFT_Body_accelerometer_JerkSignal_Magnitude_mean()_

FFT_Body_accelerometer_JerkSignal_Magnitude_std()_

FFT_Body_accelerometer_JerkSignal_Magnitude_meanFreq()_

FFT_Body_gyroscope_Magnitude_mean()_

FFT_Body_gyroscope_Magnitude_std()_

FFT_Body_gyroscope_Magnitude_meanFreq()_

FFT_Body_gyroscope_JerkSignal_Magnitude_mean()_

FFT_Body_gyroscope_JerkSignal_Magnitude_std()_

FFT_Body_gyroscope_JerkSignal_Magnitude_meanFreq()_
```


# Steps Done:

1. read data and merged them
2. read feature names and parsed them using regular expression 
3. applied transformation for each parth of the feature name to give it a descrptive one (name splitting provided above)
4. filtered the feature names based on a given pettern (here it is mean and std) 
5. used dplyr group by feature to summarize each column by response and subject
6. write newData and feature names 
