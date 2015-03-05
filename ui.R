library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Cauchy (location 0, scale 1) and Normal(0,1)"),
  
  # Sidebar with a slider input for trials and sample size
  sidebarLayout(
    sidebarPanel(
      sliderInput("trials",
                  "Number of trials:",
                  min = 2,
                  max = 200,
                  value = 20),
      sliderInput("samples.in.trial",
                  "Samples per trial:",
                  min = 1,
                  max = 200,
                  value = 1),
      actionButton("action", label="Run Again")
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      br(),
        a("Code here", 
          href = "https://github.com/lawsonb/cauchynormal", 
          target="_blank")
    )
  )
))
