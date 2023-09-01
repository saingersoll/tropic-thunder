# tropic-thunder
Group 5 Project Repo

Raw Data Distribution
4 Rivers: PRM, Q1, Q2, Q3 

Navigate in taylor terminal to /courses/EDS214/group_project/tropic-thunder-data

The code to read in data is as follows library(tidyverse)
RS_data <- read_csv("/courses/EDS214/group_project/tropic-thunder-data/Raw-Data/RioEspirituSanto.csv")

this pathway may be stored as a variable and called to action when reading in files by using read_csv(file.path(var-name, fsep = file-name.csv))


Each raw data set is read in to tidy
tidying steps include:
clean_name, lubridate, select, mutate, and filter
the cleaned data for each are stored and saved as files

In Console: sampling timelines determined
PRM Start Date: 1989-05-16
Q1:Q3 Start Date: 1989-05-20
PRM:Q3 End Date: 2015-12-25

These 4 cleaned data sets were then to be merged using bind_rows

Installed package plotly to use subplot(n_plot, k_plot, nrows = 2) to stack graphs and store as final_plot

From here, the plot was customized using the plotly package

--
The second question was approached by reading in a data set from Brynne Bryan. (2010). Rio Mameyes diatoms in the Rio Mameyes from 1998 to 2001. LTER Network Member Node. https://pasta.lternet.edu/package/metadata/eml/knb-lter-luq/114/4663700.

A cross_join between our total_data in part 1 and the new, cleaned, data.
This was used to create the ggplot for observation
