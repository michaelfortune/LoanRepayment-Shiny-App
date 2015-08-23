#' Function to calculate loan repayments
#' based on:
#' a) loan amount (present value)
#' b) annual interest rate
#' c) number of monthly payment periods
#' Function returns monthly payment
#' Useful for e.g. working out repayment mortgage payments
#' @param pv a present value
#' @param r a annual compound interest rate
#' @param n a number of payments e.g.  20 years = 240 payments
#' @return p the amount of each monthly payment
#' @author Michael Fortune
#' @details
#' This function uses a formula to calculate the monthly repayments
#' of a loan over a number of months
#' @export
LoanPayments <- function(pv, r, n) {

r <- r / 1200

P = ( r * pv ) / ( 1 - ((1+r)^-n))

}
