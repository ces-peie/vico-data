library(tidyverse)
source("scripts/helpers.R")


#---- Load relevant raw files ----
raw_sujeto_hospital <- load_raw_data("Sujeto_Hospital.csv")
raw_h1              <- load_raw_data("H1.csv")
raw_h2c             <- load_raw_data("H2C.csv")
raw_h2ce            <- load_raw_data("H2CE.csv")
raw_h2cv            <- load_raw_data("H2CV.csv")
raw_h2drf           <- load_raw_data("H2DRF.csv")
raw_h2f             <- load_raw_data("H2F.csv")
raw_h2n             <- load_raw_data("H2N.csv")
raw_h2rem           <- load_raw_data("H2REM.csv")


#---- Merge data sources ----
screening_hospital <- raw_sujeto_hospital %>%
  left_join(raw_h1, by="SubjectID") %>%
  left_join(raw_h2c, by="SubjectID") %>%
  left_join(raw_h2ce, by="SubjectID") %>%
  left_join(raw_h2cv, by="SubjectID") %>%
  left_join(raw_h2drf, by="SubjectID") %>%
  left_join(raw_h2f, by="SubjectID") %>%
  left_join(raw_h2n, by="SubjectID") %>%
  left_join(raw_h2rem, by="SubjectID")


#---- Unload pracessed data block ----
unload_data_block(screening_hospital)
