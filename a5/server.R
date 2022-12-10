#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(maps)
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/a5-Dav1dCzy/main/owid-co2-data.csv")

world_map <- map_data('world')
co2_2020 <- data %>%
  mutate(percentage = cement_co2 / co2) %>%
  select(country, year, co2, cement_co2, percentage)

names(co2_2020)[1] <- paste("region")
map_percentage <- left_join(co2_2020, world_map, by = "region")

shinyServer(function(input, output) {
  
  observeEvent(map_percentage, {
    updateSliderInput(
      inputId = "year",
      min = min(map_percentage$year),
      max = max(map_percentage$year),
    )
  })
  
  filter_range <- reactive({
    map_percentage %>%
      filter(year == input$year)
  })

  output$distPlot <- renderPlotly({
    plot <- ggplotly(ggplot(filter_range(), aes(long, lat, group = group)) + 
                       geom_polygon(aes(fill = percentage)) +
                       scale_fill_gradient(low = "white", high = "black", na.value = NA))
    })
})
