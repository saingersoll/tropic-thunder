# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# Load packages required to define the pipeline:
library(targets)
# library(tarchetypes) # Load other packages as needed.

# Set target options:
tar_option_set(
  packages = c("tibble") # packages that your targets need to run
  # format = "qs", # Optionally set the default storage format. qs is fast.
  #
  # For distributed computing in tar_make(), supply a {crew} controller
  # as discussed at https://books.ropensci.org/targets/crew.html.
  # Choose a controller that suits your needs. For example, the following
  # sets a controller with 2 workers which will run as local R processes:
  #
  #   controller = crew::crew_controller_local(workers = 2)
  #
  # Alternatively, if you want workers to run on a high-performance computing
  # cluster, select a controller from the {crew.cluster} package. The following
  # example is a controller for Sun Grid Engine (SGE).
  # 
  #   controller = crew.cluster::crew_controller_sge(
  #     workers = 50,
  #     # Many clusters install R as an environment module, and you can load it
  #     # with the script_lines argument. To select a specific verison of R,
  #     # you may need to include a version string, e.g. "module load R/4.3.0".
  #     # Check with your system administrator if you are unsure.
  #     script_lines = "module load R"
  #   )
  #
  # Set other options as needed.
)

# tar_make_clustermq() is an older (pre-{crew}) way to do distributed computing
# in {targets}, and its configuration for your machine is below.
options(clustermq.scheduler = "multicore")

# tar_make_future() is an older (pre-{crew}) way to do distributed computing
# in {targets}, and its configuration for your machine is below.
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(
  tar_target(PRM, "raw-data/RioMameyesPuenteRoto.csv", format = "file"),
  # Reading in PRM
  tar_target(Q1, "raw-data/QuebradaCuenca1-Bisley.csv", format = "file"),
  # Reading in Q1
  tar_target(Q2, "raw-data/QuebradaCuenca2-Bisley.csv", format = "file"),
  # Reading in Q2
  tar_target(Q3, "raw-data/QuebradaCuenca3-Bisley.csv", format = "file"),
  # Reading in Q3
  
  # CAUTION BEFORE RUNNING, CHECK ABOUT THE NAMING OF NEW DATA
  # I want to save this data in the read in file that is then cleaned
  
  # Do I need to write the cleaning portion here
  
  tar_target(PRM_data, get_data(PRM)),
  # Grabbing PRM data
  tar_target(Q1_data, get_data(Q1)),
  # Grabbing Q1 data
  tar_target(Q2_data, get_data(Q2)),
  # Grabbing Q2 data
  tar_target(Q3_data, get_data(Q3)),
  # Grabbing Q3 data
  
  # Cleaning data sets
  # ? How do I demonstrate this code properly in target
  
  tar_target(PRM_clean, scrub_funct(PRM_data)),
  # Cleaning PRM data set
  tar_target(Q1_clean, scrub_funct(Q1_data)),
  # Cleaning Q1 data set 
  tar_target(Q2_clean, scrub_funct(Q2_data)),
  # Cleaning Q2 data set  
  tar_target(Q3_clean, scrub_funct(Q3_data)),
  # Cleaning Q3 data set  

  
  # Binding Data Sets
  tar_target(total_data1, binding_data(PRM_clean, Q1_clean)),
  # Bound by rows PRM + Q1lean, Q3_clean))
  # Bound by rows Q1 + Q3
  tar_target(total_data, binding_data(total_data1, total_data2)),
  
  
  # Ggplot Graphing
  
  tar_target(k_plot, k_plot(total_data))

