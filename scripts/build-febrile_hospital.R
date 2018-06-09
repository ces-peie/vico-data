library(tidyverse)
source("scripts/helpers.R")


#---- Load relevant raw files ----
raw_sujeto_hospital <- load_raw_data("Sujeto_Hospital.csv")
# raw_h1       <- load_raw_data("H1.csv")
# raw_h2c      <- load_raw_data("H2C.csv")
# raw_h2ce     <- load_raw_data("H2CE.csv")
# raw_h2cv     <- load_raw_data("H2CV.csv")
# raw_h2drf    <- load_raw_data("H2DRF.csv")
# raw_h2f      <- load_raw_data("H2F.csv")
# raw_h2n      <- load_raw_data("H2N.csv")
# raw_h2rem    <- load_raw_data("H2REM.csv")
raw_h3a      <- load_raw_data("H3A.csv")
raw_h3b      <- load_raw_data("H3B.csv")
raw_h3c      <- load_raw_data("H3C.csv")
raw_h3d      <- load_raw_data("H3D.csv")
raw_h3e      <- load_raw_data("H3E.csv")
raw_h3f      <- load_raw_data("H3F.csv")
raw_h3g      <- load_raw_data("H3G.csv")
raw_h3h      <- load_raw_data("H3H.csv")
raw_h3j      <- load_raw_data("H3J.csv")
raw_h3k      <- load_raw_data("H3K.csv")
raw_h3l      <- load_raw_data("H3L.csv")
raw_h5h      <- load_raw_data("H5H.csv")
raw_h5v      <- load_raw_data("H5V.csv")
raw_h7       <- load_raw_data("H7.csv")
raw_h7h      <- load_raw_data("H7H.csv")
raw_h7n      <- load_raw_data("H7N.csv")
raw_h7p      <- load_raw_data("H7P.csv")
raw_h7pda    <- load_raw_data("H7PDA.csv")
raw_h7papel  <- load_raw_data("H7Papel.csv")
raw_lab_febril_resultados <- load_raw_data("FebrilResultados.csv")


#---- Merge data sources ----
febrile_hospital <- raw_sujeto_hospital %>%
  # left_join(raw_h1, by="SubjectID") %>%
  # left_join(raw_h2c, by="SubjectID") %>%
  # left_join(raw_h2ce, by="SubjectID") %>%
  # left_join(raw_h2cv, by="SubjectID") %>%
  # left_join(raw_h2drf, by="SubjectID") %>%
  # left_join(raw_h2f, by="SubjectID") %>%
  # left_join(raw_h2n, by="SubjectID") %>%
  # left_join(raw_h2rem, by="SubjectID") %>%
  left_join(raw_h3a, by="SubjectID") %>%
  left_join(raw_h3b, by="SubjectID") %>%
  left_join(raw_h3c, by="SubjectID") %>%
  left_join(raw_h3d, by="SubjectID") %>%
  left_join(raw_h3e, by="SubjectID") %>%
  left_join(raw_h3f, by="SubjectID") %>%
  left_join(raw_h3g, by="SubjectID") %>%
  left_join(raw_h3h, by="SubjectID") %>%
  left_join(raw_h3j, by="SubjectID") %>%
  left_join(raw_h3k, by="SubjectID") %>%
  left_join(raw_h3l, by="SubjectID") %>%
  left_join(raw_h5h, by="SubjectID") %>%
  left_join(raw_h5v, by="SubjectID") %>%
  left_join(raw_h7, by="SubjectID") %>%
  left_join(raw_h7h, by="SubjectID") %>%
  left_join(raw_h7n, by="SubjectID") %>%
  left_join(raw_h7p, by="SubjectID") %>%
  left_join(raw_h7pda, by="SubjectID") %>%
  left_join(raw_h7papel, by="SubjectID") %>%
  left_join(raw_lab_febril_resultados, by="SubjectID")


#---- Keep enrolled cases ----
febrile_hospital <- febrile_hospital %>%
  filter(!is.na(SASubjectID) & elegibleFebril == 1)
  

#---- Unload pracessed data block ----
unload_data_block(febrile_hospital)
