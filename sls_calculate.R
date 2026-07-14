rm(list=ls())
setwd("C:/Users/USER/OneDrive/Magang BPS/Simulasi Petugas")
library(dplyr)
library(readxl)
# Baca data
data <- read_excel(
  "Trial Simulasi Petugas new.xlsx",
  sheet = "data"
)
head(data)
data <- data %>%
  mutate(
    kdkab  = as.character(kdkab),
    kdkec  = as.character(kdkec),
    kddesa = as.character(kddesa),
    urut_sls_desa = as.numeric(urut_sls_desa)
  )
max_sls_desa <- data %>%
  group_by(
    kdkab, nmkab,
    kdkec,
    kddesa
  ) %>%
  summarise(
    max_no_urut_sls = max(urut_sls_desa, na.rm = TRUE),
    .groups = "drop"
  )
head(max_sls_desa)
library(openxlsx)
write.xlsx(
  max_sls_desa,
  "jumlah_sls_kab_kec_desa.xlsx",
  overwrite = TRUE
)