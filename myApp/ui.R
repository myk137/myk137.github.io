library(shiny)
library(miniUI)
shinyUI(fluidPage(
    titlePanel("Prediction by Random Forest Method"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("hp", "What is the Horse Power of car?", min(mtcars$hp), 
                        max(mtcars$hp), value = round(mean(mtcars$hp))),
            sliderInput("disp", "What is the Displacement of car?", min(mtcars$disp), 
                        max(mtcars$disp), value = round(mean(mtcars$disp))),
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted MPG from Horse Power and Displacement"),
            textOutput("pred")
        )
    )
))
