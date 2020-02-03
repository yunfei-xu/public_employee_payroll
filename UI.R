library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Public Empolyee Payroll Distribution"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30),
      
      tags$hr(), # draw a line 
      
      checkboxGroupInput("location",
                "Select location:",
                  choices = unique(main$location),
                  selected = "RI 2011-2020"),
      # selectInput("year",
      #             "Select year:",
      #             choices = sort(unique(main$fy))),
      #uiOutput("cityControls"),
      uiOutput("controly"),
      uiOutput("controlj")
      # textInput("job",
      #           "search job",
      #           ""),
      
      # selectInput("job",
      #             "Select job:",
      #           choices = unique(main$title)),

      ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))