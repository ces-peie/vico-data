library(tidyverse)
source("scripts/helpers.R")


#---- Load relevant raw files ----
raw_sujeto_centro <- load_raw_data("Sujeto_Centro.csv")
raw_sujeto_puesto <- load_raw_data("Sujeto_Puesto.csv")
raw_c1c           <- load_raw_data("C1C.csv")
raw_c1ce          <- load_raw_data("C1CE.csv")
raw_c1cv          <- load_raw_data("C1CV.csv")
raw_c1f           <- load_raw_data("C1F.csv")
raw_p1c           <- load_raw_data("P1C.csv")
raw_p1ce          <- load_raw_data("P1CE.csv")
raw_p1cv          <- load_raw_data("P1CV.csv")


#---- Merge data sources ----
screening_clinic <- list(raw_sujeto_centro, raw_sujeto_puesto) %>%
  purrr::map(mutate, fechaTerminacionProyecto = as.POSIXct(fechaTerminacionProyecto)) %>%
  bind_rows() %>%
  left_join(raw_c1c, by="SubjectID") %>%
  left_join(raw_c1ce, by="SubjectID") %>%
  left_join(raw_c1cv, by="SubjectID") %>%
  left_join(raw_c1f, by="SubjectID") %>%
  left_join(raw_p1c, by="SubjectID") %>%
  left_join(raw_p1ce, by="SubjectID") %>%
  left_join(raw_p1cv, by="SubjectID")


#---- Unload pracessed data block ----
unload_data_block(screening_clinic)
