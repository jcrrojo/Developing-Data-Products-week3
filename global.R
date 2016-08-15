# Call shiny
library(shiny)

#Function input output
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