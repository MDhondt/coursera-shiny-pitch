
library(shiny)
shinyUI(fluidPage(
    titlePanel("Fitting linear Models"),
    sidebarLayout(
        sidebarPanel(
            h4("100 randoms points are plotted. Fit a polynomial through the points with a chosen degree."),
            sliderInput("degrees",
                        "Number of degrees for polynomial:",
                        min = 1,
                        max = 15,
                        value = 3)
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
))
