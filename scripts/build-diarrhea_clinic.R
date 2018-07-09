library(tidyverse)
source("scripts/helpers.R")


#---- Load relevant raw files ----
raw_sujeto_centro <- load_raw_data("Sujeto_Centro.csv")
# raw_c1c   <- load_raw_data("C1C.csv")
# raw_c1ce  <- load_raw_data("C1CE.csv")
# raw_c1cv  <- load_raw_data("C1CV.csv")
# raw_c1f   <- load_raw_data("C1F.csv")
raw_c2a   <- load_raw_data("C2A.csv")
raw_c2b   <- load_raw_data("C2B.csv")
raw_c2c   <- load_raw_data("C2C.csv")
raw_c2d   <- load_raw_data("C2D.csv")
raw_c2f   <- load_raw_data("C2F.csv")
raw_c2g   <- load_raw_data("C2G.csv")
raw_c2j   <- load_raw_data("C2J.csv")
raw_c2k   <- load_raw_data("C2K.csv")
raw_c2l   <- load_raw_data("C2L.csv")
raw_c5v   <- load_raw_data("C5V.csv")
raw_c7    <- load_raw_data("C7.csv")
raw_lab_diarrhea_resultados <- load_raw_data("DiarreaResultados.csv")


#---- Merge data sources ----
diarrhea_clinic <- raw_sujeto_centro %>%
  # left_join(raw_c1c, by="SubjectID") %>%
  # left_join(raw_c1ce, by="SubjectID") %>%
  # left_join(raw_c1cv, by="SubjectID") %>%
  # left_join(raw_c1f, by="SubjectID") %>%
  left_join(raw_c2a, by="SubjectID") %>%
  left_join(raw_c2b, by="SubjectID") %>%
  left_join(raw_c2c, by="SubjectID") %>%
  left_join(raw_c2d, by="SubjectID") %>%
  left_join(raw_c2f, by="SubjectID") %>%
  left_join(raw_c2g, by="SubjectID") %>%
  left_join(raw_c2j, by="SubjectID") %>%
  left_join(raw_c2k, by="SubjectID") %>%
  left_join(raw_c2l, by="SubjectID") %>%
  left_join(raw_c5v, by="SubjectID") %>%
  left_join(raw_c7, by="SubjectID") %>%
  left_join(raw_lab_diarrhea_resultados, by="SubjectID")


#---- Keep enrolled cases ----
diarrhea_clinic <- diarrhea_clinic %>%
  filter(!is.na(SASubjectID) & elegibleDiarrea == 1)


#---- Unload pracessed data block ----
unload_data_block(diarrhea_clinic)
