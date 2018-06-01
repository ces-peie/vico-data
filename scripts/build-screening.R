library(tidyverse)
source("scripts/helpers.R")


#---- Load relevant raw files ----
raw_sujeto_hospital <- load_raw_data("Sujeto_Hospital.csv")
raw_sujeto_centro <- load_raw_data("Sujeto_Centro.csv")
raw_sujeto_puesto <- load_raw_data("Sujeto_Puesto.csv")

raw_h1       <- load_raw_data("H1.csv")
raw_h2c      <- load_raw_data("H2C.csv")
raw_h2ce     <- load_raw_data("H2CE.csv")
raw_h2cv     <- load_raw_data("H2CV.csv")
raw_h2drf    <- load_raw_data("H2DRF.csv")
raw_h2f      <- load_raw_data("H2F.csv")
raw_h2n      <- load_raw_data("H2N.csv")
raw_h2rem    <- load_raw_data("H2REM.csv")

raw_c1c      <- load_raw_data("C1C.csv")
raw_c1ce     <- load_raw_data("C1CE.csv")
raw_c1cv     <- load_raw_data("C1CV.csv")
raw_c1f      <- load_raw_data("C1F.csv")

raw_p1c      <- load_raw_data("P1C.csv")
raw_p1ce     <- load_raw_data("P1CE.csv")
raw_p1cv     <- load_raw_data("P1CV.csv")




#---- Merge data sources ----
screening <- list(raw_sujeto_hospital, raw_sujeto_centro, raw_sujeto_puesto) %>%
  # convertir a fecha en cada set
  purrr::map(mutate, fechaTerminacionProyecto = as.POSIXct(fechaTerminacionProyecto)) %>%
  bind_rows()
  # left_join(raw_h1, by="SubjectID") %>%
  # left_join(raw_h2c, by="SubjectID") %>%
  # left_join(raw_h2ce, by="SubjectID") %>%
  # left_join(raw_h2cv, by="SubjectID") %>%
  # left_join(raw_h2drf, by="SubjectID") %>%
  # left_join(raw_h2f, by="SubjectID") %>%
  # left_join(raw_h2n, by="SubjectID") %>%
  # left_join(raw_h2rem, by="SubjectID") %>%
  # left_join(raw_c1c, by="SubjectID") %>%
  # left_join(raw_c1ce, by="SubjectID") %>%
  # left_join(raw_c1cv, by="SubjectID") %>%
  # left_join(raw_c1f, by="SubjectID") %>%
  # left_join(raw_p1c, by="SubjectID") %>%
  # left_join(raw_p1ce, by="SubjectID") %>%
  # left_join(raw_p1cv, by="SubjectID")


#---- Unload pracessed data block ----
unload_data_block(screening)
