library(shiny)
library(dplyr)
library(stringr)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$controly <- renderUI({
    pp <- filter(main,location==input$location
                 #& fy == as.numeric(input$year)
                 #& str_detect(title,input$job)
                 #& title == input$job
                 ) # select location & year & job
    
    checkboxGroupInput("year",
                "Select year:",
                choices = sort(unique(pp$fy)),
                selected = "2016")
    
  })
  
  output$controlj <- renderUI({
    pp <- filter(main,location==input$location
                 & fy == as.numeric(input$year)
                 #& str_detect(title,input$job)
                 #& title == input$job
                ) # select location & year & job
    
    #selectInput("job",
    #            "Select job:",
    #           choices = unique(pp$title))
    textInput("job",
               "Search Job:",
               "data")
    
  })
  
  output$distPlot <- renderPlot({
     
     pp <- filter(main,location==input$location
                  & fy == as.numeric(input$year)
                  & str_detect(title,
                               regex(input$job,ignore_case = T))
                  #& title == input$job
                  ) # select location & year & job
    
    bins <- seq(min(pp$annual), 
                max(pp$annual),
                length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
    options(scipen=999)
    hist(pp$annual, breaks = bins, 
         main = "Public Employee Payroll",
         xlab="Employee Salary (in dollars)", 
         col = 'skyblue', border = 'white')
  })
})