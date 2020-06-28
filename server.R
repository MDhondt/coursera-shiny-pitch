library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
    set.seed(12345)
    data <- matrix(rnorm(200,mean=5,sd=2),ncol=2)
    colnames(data) <- c("x","y")
    df <- as.data.frame(data)
    df$y <- df$y / 3
    
    output$plot <- renderPlot({
        qplot(df$x,df$y) + 
            stat_smooth(method="lm", 
                        se=TRUE, 
                        fill=NA, 
                        formula=y ~ poly(x, input$degrees, raw=TRUE),
                        colour="red") +
            xlim(0,10) +
            ylim(0,4) +
            theme_void()
    })
})
