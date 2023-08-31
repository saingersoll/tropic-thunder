# Function to read data
get_data <- function(file) {
  read_csv(file, col_types = cols()) %>%
    drop_na()
}


# Cleaning Data Sets
scrub_funct <- function(site_df) {
  site_df %>% 
  clean_names() %>% 
    mutate(clean_date = lubridate::ymd(sample_date)) %>% 
    select(clean_date, no3_n, k, sample_id)
} 