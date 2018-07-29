

library(shiny)
library (ggplot2)
library (dplyr)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        output$plotmoi <- renderPlot({
                # Poison distribution formula: P(k) = (e^-m)*(mk/k!);
                # P(k) is the fraction of cells infected by k virus particles
                # m = MOI (Multiplicity of infection) ; provide a vector with MOIs ; i.e. c (0.01, 0.05, 0.1,0.5,1,2,5,10)
                
                # Simplified: uninfected cells (k=0); cells with a single infection (k=1); and cells with multiple infection (k>1):
                # P(0) = e-m; P(1) = me-m; P(>1) = 1-e-m(m+1)*this value is obtained by subtracting from unity (the sum of all probabilities for any value of k) the probabilities P(0) and P(1)
                moi_inf_fun <- function(moi_th){
                        percentage_th <<- (1-(exp(-moi_th)))*100 
                        Table_MOI_Infected <<- cbind (moi_th, percentage_th, deparse.level = 2)
                        Table_MOI_Infected <<- mutate(data.frame(Table_MOI_Infected), data_type = "theoretical")
                        print(Table_MOI_Infected)
                }
                moi_inf_fun(c(input$moi1, input$moi2, input$moi3, input$moi4, input$moi5))
                
                #add experimental data, up to 5 MOIs/5 percentage pairs
                
                moi <- c(input$moi1, input$moi2, input$moi3, input$moi4, input$moi5)
                percentage <- c(input$percentage1, input$percentage2, input$percentage3, input$percentage4, input$percentage5)
                Table_MOI_test <- cbind (moi, percentage, deparse.level = 2)
                Table_MOI_test <- mutate(data.frame(Table_MOI_test), data_type = "experimental")
       
                #merge theoretical and experiment data
                colnames(Table_MOI_Infected) <- c("moi", "percentage", "data_type")
                Table <- rbind(Table_MOI_Infected,Table_MOI_test)
                
                #make plot
                ggplot(Table, aes(x=moi, y=percentage, color=data_type)) + 
                        geom_point()+geom_line()+
                        scale_x_continuous(breaks = c(0,1,2,3,4,5,6,7,8,9,10))+
                        theme_bw()+
                        theme(axis.text=element_text(size=14),
                              axis.title=element_text(size=14),
                              legend.text=element_text(size=14),
                              legend.title =element_text(size=14))+            
                        xlab("MOI")+
                        ylab("Percentage of infected cells")
        })
  })
  
