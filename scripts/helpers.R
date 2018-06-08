library(tidyverse)


raw_data_base_path <- "../vico-raw-data/output/tables/"
processed_data_base_path <- "./output/"


load_raw_data <- function(name) {
  read_csv(str_c(raw_data_base_path, name)) %>%
    filter(forDeletion == FALSE) %>%
    select(-forDeletion)
}


unload_data_block <- function(data_block) {
  dir.create(processed_data_base_path, showWarnings = FALSE)
  write_csv(data_block, str_c(processed_data_base_path, deparse(substitute(data_block)), ".csv"))
}
