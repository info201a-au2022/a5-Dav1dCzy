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

intro_page <- tabPanel(
  "Introduction",
  titlePanel("CO2 Emission Rearch"),
  h2("Introduction of CO2"),
  p("Carbon dioxide (CO2) is a greenhouse gas that is produced by the burning of fossil fuels and other human activities. It is a major contributor to climate change, as it traps heat in the Earth's atmosphere and contributes to global warming. Reducing CO2 emissions is therefore an important way to combat climate change."),
  h2("Question"),
  p("This assigment solves the question of", strong("CO2 emissions from cement per country per year as a percentage of total CO2 emissions")),
  h2("Method"),
  p("In this assignment, I choose", strong("the name of countries, year, total CO2 emmission, and total CO2 emission from cement"), "as variables. I calculate the percentage of CO2 emission from cement in total CO2 emission per country per year. I choose to use map to visualize the result.")
)

page_one <- tabPanel(
  "Graph",
  titlePanel("Percentage of Cement CO2 Emission in Total CO2 Emission"),
  sidebarLayout(
    sliderInput("year",
                "Year", 
                min = min(map_percentage$year),
                max = max(map_percentage$year),
                value = min(map_percentage$year)),
    mainPanel(
      plotlyOutput(outputId = 'map'),
      h2("Explanation"),
      p("This graph shows the percentage of cement CO2 emission in total CO2 emission. Users are able to select different years and see the corresponding results on the graph. The darker the color, the higher the percentage of CO2 emissions from cement."),
      h2("Analysis"),
      p("From the chart, it shows that as the there is little data about CO2 emission before 19 Centuries. Starting from 1950, most countries around the world has CO2 emission from cement. Over time, a higher percentage of total cement CO2 emissions in developing countries.")
    )
  )
)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
      
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
            plotlyOutput("distPlot")
        )
    )
))

ui <- navbarPage(
  "CO2 Emission",
  intro_page,
  page_one
)