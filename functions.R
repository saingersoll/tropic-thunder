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
    mutate(year = lubridate::year(clean_date)) %>% 
    select(clean_date, no3_n, k, sample_id) %>% 
    filter(year %in% seq[1989:1994])
} 


# Binding Rows of Data Sets
binding_data <- function(site_df, site_df2) {
  site_df %>% 
  bind_rows(site_df2)
}

# Ggplot Graphing Concentration 
k_plot <- ggplot(data = total_data , aes(x = clean_date, y = k))+
  geom_line(aes(color = sample_id)) +
  labs(x = "Year",
       y = "K mg i-1")

k_plot
