#install.packages("shiny")
library(shiny)
#setwd("C:/Users/bret/Documents/159stat2/lab 8/lab8")
#install.packages('rsconnect')
library(rsconnect)
#rsconnect::setAccountInfo(name='mhmm', 
#  token='07AE887BAF06AC976E1E18C6BD919B85', 
#  secret='EUZ1Zi1tQIVsZMiLS+vj++3NdkGrQ80GbArhSluQ')

ad <- read.csv("Advertising.csv")
attach(ad)

ui <- fluidPage(
  selectInput(inputId = "xvar", 
              label = "Choose a Predictor", 
              choices = c("TV", "Radio", "Newspaper")),
  plotOutput("scatt")
)


server <- function(input, output) {
  output$scatt <- renderPlot({
    
    plot(ad[,input$xvar], Sales, xlab = input$xvar)
    abline(lm(Sales ~ ad[,input$xvar]))
    
  })
  
}  

shinyApp(ui = ui, server = server)



#filename <- normalizePath(file.path('./images',
#                                    paste('image', input$n, '.jpeg', sep='')))

# Return a list containing the filename
#list(src = filename)
