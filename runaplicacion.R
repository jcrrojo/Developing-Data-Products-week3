
install.packages('devtools')
devtools::install_github('rstudio/shinyapps')
rsconnect::setAccountInfo(name='qindicereport', 
                          token='02373BB0669592B90A2F436E068928EA', 
                          secret='OZNDjDeRMBrDw6z2SrW7VywyWuL+qV43HmgY1F1J')
library(shinyapps)
shinyapps::deployApp('/Users/juancarlosrodriguezrojo/WorkDoc/2016/Z_Cursos/JHOPKDesigneDataProducts/Shinyapp_autoncar')

