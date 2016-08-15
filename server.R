# Call shiny
library(shiny)

#Function input output
shinyServer(function(input, output) {
# libraries
library(XLConnect)
library(lubridate)
library(DT)
library(tidyr)
library(data.table)
library(ggplot2)
library(scales)
library(dplyr)
library(reshape2)
library(ggplot2)
library(Cairo)
library(DT)
library(grid)
library(survey)
library(gridExtra)
library(Hmisc)
library(foreign)
if(!require("sjPlot"))
    install.packages("sjPlot")
library(sjPlot)
library(sjmisc)
library(memisc)

#download excel .
autoncar <-
    readWorksheetFromFile("autonomous_car.xlsx", sheet = 1)

# transforming data
## Factors
autoncar$Questions <- as.factor(autoncar$Questions)
autoncar$Levels <- as.factor(autoncar$Levels)

# Reactive
selectData1 <- reactive({autoncar[, c("Questions", "Levels","Order",  
                                    "Total", "Male", "Female", 
                                    "From.18.to.29.years", "From.30.to.44.years", "From.45.to.59.years", "From.60.to.74.years",
                                    "License.and.car", "License.without.car", "Without.a.license")]
})
# building plots
output$plot1 <- renderPlot({
    ###### Total, knowledge of autonomous car
    if (input$x1 == "Total") {
    g1 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
    g1 <- g1 + geom_bar(aes(reorder(Levels, Order), Total, fill = Total), stat = "identity")
    g1 <- g1 + labs(title = input$y1) + labs(x = " ", y = "%") 
    g1 <- g1 + coord_flip() 
    g1 <- g1 + theme(axis.text.y = element_text(angle = 0, size = 11))
    
    print(g1)}
    ###### Variables
    else {if (input$x1 == "Sex")
    { g11 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
    g11 <- g11 + geom_bar(aes(reorder(Levels, Order), Male, fill = Male), stat = "identity") 
    g11 <- g11 + scale_fill_gradient(low = "yellow", high = "red")
    g11 <- g11 + labs(title = input$y1) + labs(x = " ", y = "%") 
    g11 <- g11 + coord_flip() 
    g11 <- g11 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g12 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
    g12 <- g12 + geom_bar(aes(reorder(Levels, Order), Female, fill = Female), stat = "identity") 
    g12 <- g12 + scale_fill_gradient(low = "yellow", high = "red")
    g12 <- g12 + labs(title = input$y1) + labs(x = " ", y = "%") 
    g12 <- g12 + coord_flip() 
    g12 <- g12 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g1 <- grid.arrange(g11, g12, ncol = 2)
    print (g1)} 
    
    else {if (input$x1 == "Age")
    { g21 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
    g21 <- g21 + geom_bar(aes(reorder(Levels, Order), From.18.to.29.years, fill = From.18.to.29.years), stat = "identity") 
    g21 <- g21 + scale_fill_gradient(low = "gray", high = "green")
    g21 <- g21 + labs(title = input$y1) + labs(x = " ", y = "%") 
    g21 <- g21 + coord_flip() 
    g21 <- g21 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g22 <- ggplot(subset(selectData1(), Questions == input$y1), aes())
    g22 <- g22 + geom_bar(aes(reorder(Levels, Order), From.30.to.44.years, fill = From.30.to.44.years), stat = "identity") 
    g22 <- g22 + scale_fill_gradient(low = "gray", high = "green")
    g22 <- g22 + labs(title = input$y1) + labs(x = " ", y = "%") 
    g22 <- g22 + coord_flip() 
    g22 <- g22 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g23 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
    g23 <- g23 + geom_bar(aes(reorder(Levels, Order), From.45.to.59.years, fill = From.45.to.59.years), stat = "identity") 
    g23 <- g23 + scale_fill_gradient(low = "gray", high = "green")
    g23 <- g23 + labs(title = input$y1) + labs(x = " ", y = "%") 
    g23 <- g23 + coord_flip() 
    g23 <- g23 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g24 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
    g24 <- g24 + geom_bar(aes(reorder(Levels, Order), From.60.to.74.years, fill = From.60.to.74.years), stat = "identity") 
    g24 <- g24 + scale_fill_gradient(low = "gray", high = "green")
    g24 <- g24 + labs(title = input$y1) + labs(x = " ", y = "%") 
    g24 <- g24 + coord_flip() 
    g24 <- g24 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g1 <- grid.arrange(g21, g22, g23, g24, ncol = 2)
    print (g1)}

            else {if (input$x1 == "License and car")
            {g31 <- ggplot(subset(selectData1(), Questions == input$y1), aes())
            g31 <- g31 + geom_bar(aes(reorder(Levels, Order), License.and.car, fill = License.and.car), stat = "identity")
            g31 <- g31 + scale_fill_gradient(low = "gray", high = "purple")
            g31 <- g31 + labs(title = input$y1) + labs(x = " ", y = "%") 
            g31 <- g31 + coord_flip() 
            g31 <- g31 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
            g32 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
            g32 <- g32 + geom_bar(aes(reorder(Levels, Order), License.without.car, fill = License.without.car), stat = "identity") 
            g32 <- g32 + scale_fill_gradient(low = "gray", high = "purple")
            g32 <- g32 + labs(title = input$y1) + labs(x = " ", y = "%") 
            g32 <- g32 + coord_flip() 
            g32 <- g32 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
            g33 <- ggplot(subset(selectData1(), Questions == input$y1), aes()) 
            g33 <- g33 + geom_bar(aes(reorder(Levels, Order), Without.a.license, fill = Without.a.license), stat = "identity") 
            g33 <- g33 + scale_fill_gradient(low = "gray", high = "purple")
            g33 <- g33 + labs(title = input$y1) + labs(x = " ", y = "%") 
            g33 <- g33 + coord_flip() 
            g33 <- g33 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
            g1 <- grid.arrange(g31, g32, g33, ncol = 2)
            print (g1) }
        
        }}}
    
})

output$plot2 <- renderPlot({
    ###### Total, Attribution security to autonomous car versus a human driver
    if (input$x2 == "Total") {
        g2 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
        g2 <- g2 + geom_bar(aes(reorder(Levels, Order), Total, fill = Total), stat = "identity")
        g2 <- g2 + labs(title = input$y2) + labs(x = " ", y = "%") 
        g2 <- g2 + coord_flip() 
        g2 <- g2 + theme(axis.text.y = element_text(angle = 0, size = 11))
        
        print(g2)}
    ###### Variables
    else {if (input$x2 == "Sex")
    { g11 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
    g11 <- g11 + geom_bar(aes(reorder(Levels, Order), Male, fill = Male), stat = "identity") 
    g11 <- g11 + scale_fill_gradient(low = "yellow", high = "red")
    g11 <- g11 + labs(title = input$y2) + labs(x = " ", y = "%") 
    g11 <- g11 + coord_flip() 
    g11 <- g11 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g12 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
    g12 <- g12 + geom_bar(aes(reorder(Levels, Order), Female, fill = Female), stat = "identity") 
    g12 <- g12 + scale_fill_gradient(low = "yellow", high = "red")
    g12 <- g12 + labs(title = input$y2) + labs(x = " ", y = "%") 
    g12 <- g12 + coord_flip() 
    g12 <- g12 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
    g2 <- grid.arrange(g11, g12, ncol = 2)
    print (g2)} 
        
        else {if (input$x2 == "Age")
        { g21 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
        g21 <- g21 + geom_bar(aes(reorder(Levels, Order), From.18.to.29.years, fill = From.18.to.29.years), stat = "identity") 
        g21 <- g21 + scale_fill_gradient(low = "gray", high = "green")
        g21 <- g21 + labs(title = input$y2) + labs(x = " ", y = "%") 
        g21 <- g21 + coord_flip() 
        g21 <- g21 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
        g22 <- ggplot(subset(selectData1(), Questions == input$y2), aes())
        g22 <- g22 + geom_bar(aes(reorder(Levels, Order), From.30.to.44.years, fill = From.30.to.44.years), stat = "identity") 
        g22 <- g22 + scale_fill_gradient(low = "gray", high = "green")
        g22 <- g22 + labs(title = input$y2) + labs(x = " ", y = "%") 
        g22 <- g22 + coord_flip() 
        g22 <- g22 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
        g23 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
        g23 <- g23 + geom_bar(aes(reorder(Levels, Order), From.45.to.59.years, fill = From.45.to.59.years), stat = "identity") 
        g23 <- g23 + scale_fill_gradient(low = "gray", high = "green")
        g23 <- g23 + labs(title = input$y2) + labs(x = " ", y = "%") 
        g23 <- g23 + coord_flip() 
        g23 <- g23 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
        g24 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
        g24 <- g24 + geom_bar(aes(reorder(Levels, Order), From.60.to.74.years, fill = From.60.to.74.years), stat = "identity") 
        g24 <- g24 + scale_fill_gradient(low = "gray", high = "green")
        g24 <- g24 + labs(title = input$y2) + labs(x = " ", y = "%") 
        g24 <- g24 + coord_flip() 
        g24 <- g24 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
        g2 <- grid.arrange(g21, g22, g23, g24, ncol = 2)
        print (g2)}
            
            else {if (input$x2 == "License and car")
            {g31 <- ggplot(subset(selectData1(), Questions == input$y2), aes())
            g31 <- g31 + geom_bar(aes(reorder(Levels, Order), License.and.car, fill = License.and.car), stat = "identity")
            g31 <- g31 + scale_fill_gradient(low = "gray", high = "purple")
            g31 <- g31 + labs(title = input$y1) + labs(x = " ", y = "%") 
            g31 <- g31 + coord_flip() 
            g31 <- g31 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
            g32 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
            g32 <- g32 + geom_bar(aes(reorder(Levels, Order), License.without.car, fill = License.without.car), stat = "identity") 
            g32 <- g32 + scale_fill_gradient(low = "gray", high = "purple")
            g32 <- g32 + labs(title = input$y2) + labs(x = " ", y = "%") 
            g32 <- g32 + coord_flip() 
            g32 <- g32 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
            g33 <- ggplot(subset(selectData1(), Questions == input$y2), aes()) 
            g33 <- g33 + geom_bar(aes(reorder(Levels, Order), Without.a.license, fill = Without.a.license), stat = "identity") 
            g33 <- g33 + scale_fill_gradient(low = "gray", high = "purple")
            g33 <- g33 + labs(title = input$y2) + labs(x = " ", y = "%") 
            g33 <- g33 + coord_flip() 
            g33 <- g33 + theme(axis.text.y = element_text(angle = 0, size = 11)) 
            g2 <- grid.arrange(g31, g32, g33, ncol = 2)
            print (g2) }
                
            }}}
    
})
})

