
library(shiny)
library (ggplot2)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Test your viral titers to obtain correct MOI in cell culture"),
  sidebarLayout(
    sidebarPanel(
        h5("Enter your estimated MOI and the corresponding experimental percentage of infected cells"),
        numericInput("moi1",
                   "MOI and percentage pair 1",
                   value = 0, min = 0),
        numericInput("percentage1", label = NULL,
                    value = 0),
        numericInput("moi2",
                    "MOI and percentage pair 2",
                    value = 0, min = 0),
        numericInput("percentage2", label = NULL,
                    value = 0),
        numericInput("moi3",
                     "MOI and percentage pair 3",
                     value = 0, min = 0),
        numericInput("percentage3", label = NULL,
                     value = 0),
        numericInput("moi4",
                     "MOI and percentage pair 4",
                     value = 0, min = 0),
        numericInput("percentage4", label = NULL,
                     value = 0),
        numericInput("moi5",
                     "MOI and percentage pair 5",
                     value = 0, min = 0),
        numericInput("percentage5", label = NULL,
                     value = 0),
        submitButton(text = "Apply Changes", icon = NULL, width = NULL)
    ),
    
    mainPanel(
            h5("In virology, researchers very often need to calculate the multiplicity of infection (MOI) for cell culture experiments, which refers to the number of infectious particles to be added per cell. The concentration of infectious particles in a virus stock is frequently calculated in standard cell types, but sometimes the infectivity varies between those cells and the cell type we want to study, leading to different effective MOIs in the experiments."),
            h5("With this app, you can evaluate if your MOI calculations lead to the expected percentage of infected cells in your cell type of interest according to the poisson distribution (plotted in blue), and adjust the virus dose accordingly."),
            h5("You just need to type in the left panel the MOIs that you are testing and the experimental percentage of infected cells that you obtain (by flow cytometry or immunofluorescence, for example), which will be plotted in red.  You can include up to 5 data pairs.For example: pair 1: 0.2, 5; pair 2: 0.5, 20; pair 3: 1, 40; pair 4:3,70; pair 5:10,90 (0.2, 0.5, 1, 3 and 10 MOI results in 5%, 20%, 40%, 70 and 90% infected cells, respectively)."), 
            plotOutput("plotmoi")
        
    )
  )
))
