
# This is the server logic for my Shiny web application.
#
#
# It calculates calculate loan repayments
# based on:
# a) loan amount (present value)
# b) annual interest rate
# c) number of monthly payment periods
# Function returns monthly payment
# Useful for e.g. working out repayment mortgage payments
# param pv a present value
# param r a annual compound interest rate
# param n a number of payments e.g.  20 years = 240 payments
# input in the ui.R and a graph showing total payments over
# time is displayed.
# author Michael Fortune



shinyServer(function(input, output) {

  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  #
  output$distPlot <- renderPlot({
    options(scipen=10)
    int <- as.numeric(input$r)/1200
    loan <- input$pv
    term <- input$n
    P <- (int * loan) /  (1 - ((1+int)^-term))
    Payments <- seq(P, term*P, P)
    plot(Payments, type="o", col="blue", xlab = "Months", ylab = "Total Payments")
    title(main = paste("Loan Repayments (Rounded):", term, "payments x ", round(P,0), " Total:" , round(term*P,0)), col.main="blue", font.main=3)
  },height = 500, width = 700)
})
