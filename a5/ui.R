#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("https://raw.githubusercontent.com/info201a-au2022/a5-Dav1dCzy/main/a5/server.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("CO2 Emissions from Cement per Country per Year as a Percentage of Total CO2 Emissions"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
          sliderInput("year",
                      "Year:",
                      min = min(map_percentage$year),
                      max = max(map_percentage$year),
                      value = min(map_percentage$year)),

        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("distPlot")
        )
    )
))
