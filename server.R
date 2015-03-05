library(shiny)

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({

    n = input$trials
    p = input$samples.in.trial
    
    n.sample.means = sapply(1:n, function(k) {
      input$action
      c(mean(rcauchy(p)), mean(rnorm(p)))
    })
  
    ymax = max( density(n.sample.means[1,])$y, density(n.sample.means[2,])$y)
    
    plot(density(n.sample.means[1,]), col = "red",
         main = "Cauchy (red) and Normal (blue)",
         sub = paste("Refreshes",input$action),
         ylim = c(0, ymax))
    
    lines(density(n.sample.means[2,]), col = "blue")
    
    mtext(paste(n,"trials, each trial is the mean of samples of size",p))
  })
})
