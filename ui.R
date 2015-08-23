# This is the user interface logic for my Shiny web application.
##
# the server app calculates calculate loan repayments
# based on:
# a) loan amount (present value)
# b) annual interest rate
# c) number of monthly payment periods
# Function returns monthly payment
# Useful for e.g. working out repayment mortgage payments
# param pv a present value
# param r a annual compound interest rate
# param n a number of payments e.g.  20 years = 240 payments
# input here in the ui.R and a graph showing total payments
# over time is displayed.
# author Michael Fortune



library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Loan Repayment Calculator"),
  tags$p("This Shiny app allows you to calculate what your monthly repayments would be for a loan.
           Simply select the Annual interest, input the number of months and select the loan amount.
           The graph on the right will show how much you have paid over time and the graph title
           contains the repayment amount and the total (rounded). The app's reactive nature allows
           you to change any of the three values and immediately see the new value e.g. how much
           more do I need to pay if I reduce the period by 60 months etc."),

  sidebarLayout(

    sidebarPanel(

      selectInput("r", "Select Annual Interest Rate here from the dropdown:",
                  choices = c(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0)),

      numericInput("n", "Enter Number of monthly repayments:", 240),

      ### Slider to select the amount of the loan
      sliderInput("pv",
                  "Enter the amount that you wish to loan",
                  min = 10000,
                  max = 500000,
                  value = 100000)

      ), ## end

      mainPanel(plotOutput("distPlot")),

  )

))

