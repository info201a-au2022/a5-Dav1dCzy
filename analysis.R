library(dplyr)
library(ggplot2)
install.packages("plotly")
library(plotly)

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/a5-Dav1dCzy/main/owid-co2-data.csv")

co2_2020 <- data %>%
  mutate(percentage = cement_co2 / co2) %>%
  select(country, co2, cement_co2, percentage)


  