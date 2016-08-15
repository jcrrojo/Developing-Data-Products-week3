# Llamamos a shiny
library(shiny)
library(ggplot2)
library(markdown)

###UI
dataset <- autoncar

shinyUI(navbarPage("The autonomous car",
                   {tabPanel("Usage documentation",
                             fluidPage(
                                 
                                 title = "Usage documentation",
                                 wellPanel(
                                     HTML(markdownToHTML(fragment.only = TRUE, 
                                                         text=c("To use this interactive application Shiny just have to consider three simple guidelines:

                                                                1. At the top of the panel, next to the link that leads to these instructions, there are two options content. These contents refer to the knowledge of the autonomous car and the allocation of security to the autonomous car compared with a human driver. By clicking on each, we will access the corresponding content.
                                                                2. Within each content page, by default, we can see the results of a survey conducted in Spain, for the total of the general population. Below the graph, you can select other options: comparing results by gender, by age or by the provision of license and car.
                                                                3. In each graph, there is a color scale that facilitates the observation of differences between the categories of a variable.
                                                                "))))
                                 
                                 ))},
                   {tabPanel("The autonomous car ... is there? Does anyone is developing?",
    fluidPage(
    
    title = "The autonomous car",
    
    plotOutput('plot1', height = "900px"), 
    
    hr(),
    
    
    fluidRow(
        column(5, offset = 1,
               selectInput('y1', 'Knowledge autonomous car', c(levels(as.factor(dataset$Questions))[1]), 
                           levels(as.factor(dataset$Questions))[1]
               )),
        column(4,
               selectInput('x1', 'Total or groups', c("Total", "Sex", "Age", 
                                                             "License and car"))
        ),
        height = "1000px"    
)))},
{tabPanel("Attribution security to autonomous car versus a human driver",
          fluidPage(
              
              title = "The autonomous car",
              
              plotOutput('plot2'),
              
              hr(),
              
              fluidRow(
                  column(5, offset = 1,
                         selectInput('y2', 'Security', c(levels(as.factor(dataset$Questions))[2]),
                                     levels(as.factor(dataset$Questions))[2]
                         )),
                  column(4,
                         selectInput('x2', 'Total or groups', c("Total", "Sex", "Age",  
                                                                        "License and car"))
                  )
             )))}
 ))


