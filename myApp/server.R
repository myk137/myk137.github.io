library(shiny)
library(ggplot2)
library(randomForest)
shinyServer(function(input, output) {
    mtcar <- mtcars[,c(1,3,4)]
    model <- randomForest(mpg ~ disp + hp, data=mtcar)
    
    modelpred <- reactive({
        dispInput <- input$disp; hpInput <- input$hp
        predict(model, newdata = data.frame(disp = dispInput, hp = hpInput))
    })
    
    output$plot1 <- renderPlot({
        dispInput <- input$disp; hpInput <- input$hp
        
        ggplot(mtcar, aes(y=mpg, x=disp, color=hp)) + geom_point(size=5, alpha=0.7) + 
            labs(x="Displacement", y="MPG") + labs(colour="Horse Power") + 
            geom_point(x=dispInput, y=modelpred(), color=hpInput, size=7)
    })   
    
    output$pred <- renderText({
        modelpred()
    })
})
    