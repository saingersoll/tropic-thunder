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
    mutate(clean_year = lubridate::year(clean_date)) %>% 
    select(clean_year, clean_date, no3_n, k, sample_id) %>%
    filter(clean_year == 1989 |clean_year == 1990 |
                      clean_year == 1991| clean_year == 1992|
                      clean_year == 1993 | clean_year == 1994)
} 


# Binding Rows of Data Sets
binding_data <- function(site_df, site_df2) {
  site_df %>% 
  bind_rows(site_df2)
}

# Ggplot Graphing Concentration 
sample_plot <- function(total_df, col_no) {
  ggplot(data = total_df , aes(x = clean_date, y = col_no()))+
  geom_line(aes(color = sample_id)) +
  labs(x = "Year")
}
