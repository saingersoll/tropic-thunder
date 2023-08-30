# tropic-thunder
Group 5 Project Repo

Raw Data Distribution
First 4 Rivers 

Navigate in taylor terminal to /courses/EDS214/group_project/tropic-thunder-data

The code to read in data is as follows library(tidyverse)
RS_data <- read_csv("/courses/EDS214/group_project/tropic-thunder-data/Raw-Data/RioEspirituSanto.csv")

this pathway may be stored as a variable and called to action when reading in files by using read_csv(file.path(var-name, fsep = file-name.csv))


Each individual is assigned raw data sets to tidy
tidying steps include:
snake_case, timeline/sampling averaging, lubridate, INCLUDE OTHER ACTIONS HERE
the cleaned data for each are stored and saved as files
these 4 cleaned data sets are then to be merged using full_join 

Personal qmd files are then uploaded to shared repository 

In final qmd, files of full_join called in and merged for a final qmd script that includes a saved and stored meta full_join 

This stored meta full join is utilized to create graphs

