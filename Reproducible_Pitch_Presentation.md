My Reproducible Pitch Presentation
========================================================
author: Juan Carlos Rodriguez Rojo
date: 15/08/2016

Shiny app Presentation
========================================================
<small><small>To use the interactive application Shiny just have to consider three simple guidelines:</small></small>

<small> 1. At the top of the panel, next to the link that leads to these instructions, there are two options content. These contents refer to the knowledge of the autonomous car and the allocation of security to the autonomous car compared with a human driver. By clicking on each, we will access the corresponding content.</small>
<small> 2. Within each content page, by default, we can see the results of a survey conducted in Spain, for the total of the general population. Below the graph, you can select other options: comparing results by gender, by age or by the provision of license and car.</small>
<small> 3. In each graph, there is a color scale that facilitates the observation of differences between the categories of a variable.</small>


Extract app code
========================================================



```r
    library(ggplot2)
    library(data.table)
    library(XLConnect)
#download excel .
    autoncar <-
        readWorksheetFromFile("autonomous_car.xlsx", sheet = 1)
    # transforming data
    ## Factors
    autoncar$Questions <- as.factor(autoncar$Questions)
    autoncar$Levels <- as.factor(autoncar$Levels)
    g2 <- ggplot(subset(autoncar, Questions == "Security of autonomous car versus a human driver"), aes()) 
    g2 <- g2 + geom_bar(aes(reorder(Levels, Order), Total, fill = Total), stat = "identity")
    g2 <- g2 + labs(title = "Security of autonomous car versus a human driver") + labs(x = " ", y = "%") 
    g2 <- g2 + coord_flip() 
    g2 <- g2 + theme(axis.text.y = element_text(angle = 0, size = 11))
    g2
```


 Plot of extract app code
========================================================

![plot of chunk unnamed-chunk-2](Reproducible_Pitch_Presentation-figure/unnamed-chunk-2-1.png) 


Slide With app URL
========================================================





This is the app URL:


https://qindicereport.shinyapps.io/Shinyapp_autoncar/
