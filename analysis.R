library(dplyr)
library(ggplot2)
install.packages("plotly")
library(plotly)

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/a5-Dav1dCzy/main/owid-co2-data.csv")

world_map <- map_data('world')
co2_2020 <- data %>%
  mutate(percentage = cement_co2 / co2) %>%
  select(country, year, co2, cement_co2, percentage)

names(co2_2020)[1] <- paste("region")
map_percentage <- left_join(co2_2020, world_map, by = "region")



  