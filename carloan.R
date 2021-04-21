#Car Loan Monthly Installment Calculator Demo

ui<-pageWithSidebar(
    # Application title
    headerPanel("Car Loan Monthly Installment Calculator"),
    sidebarPanel(
      numericInput('price', 'Car Price (RM)',50000, min = 5000, max = 500000, step = 1),
      numericInput('dp', 'Down Payment (RM)',5000, min = 0, max = 500000, step = 1),
      sliderInput('period', "Duration of the loan (in years)", min = 1, max = 9, value = 5, step = 1),
#      numericInput('Loan Period', 'Load Period (Years)',5, min = 1, max = 9),
      numericInput('rate', 'Interest Rate (%)',4, min = 0, max = 70, step = 1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of Car Loan Calculation'),
      h4('You entered Car Price (RM)'),
      verbatimTextOutput("inputValuePrice"),
      h4('You entered Down Payment (RM)'),
      verbatimTextOutput("inputValueDp"),
      h4('You entered Loan Period (Years)'),
      verbatimTextOutput("inputValuePeriod"),
      h4('You entered Interest Rate (%)'),
      verbatimTextOutput("inputValueRate"),
      h4('Which resulted in Car Loan Monthly Installment of RM :'),
      verbatimTextOutput("Installment")
    )
  )

Calc <- function(price, dp, period, rate) ((price-dp)*(period*rate/100)+price-dp)/(period*12)

server<- function(input, output) {
    output$inputValuePrice <- renderPrint({input$price})
    output$inputValueDp <- renderPrint({input$dp})
    output$inputValuePeriod <- renderPrint({input$period})
    output$inputValueRate <- renderPrint({input$rate})
    output$Installment <- renderPrint({Calc(input$price,input$dp,input$period,input$rate)})
  }


shinyApp(ui = ui, server = server)