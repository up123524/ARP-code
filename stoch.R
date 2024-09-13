library(fBasics)
library(quantmod)

# Set the stock ticker and date range
ticker <- "TSLA"
start_date <- as.Date("2015-01-01")
end_date <- as.Date("2021-09-01")

# Fetch historical stock price data
stock_data <- getSymbols(ticker, src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)
price_data <- Cl(stock_data)
daily_returns<-diff(price_data)

#infinitly divisable ditribution
nigFit(daily_returns,method = "mle", doplot=FALSE,trace=FALSE)
alpha=0.5967951
beta= 0.5956619
delta= 2.3282882
mu= 13.3966683

# Ks goodness of fit test
nig_density <- function(x, mu, alpha, beta, delta) {
  d <- sqrt(alpha^2 - beta^2)
  return ((alpha * delta) / (sqrt(2 * pi) * (x - mu)) * exp(delta * (d - (x - mu) * beta)) * besselK(delta * sqrt((x - mu)^2 + d^2), 1))
}

fitted_pdf <- nig_density(seq(min(daily_returns, na.rm = TRUE), max(daily_returns, na.rm = TRUE), length.out = 1000), mu = params["mu"], alpha = params["alpha"], beta = params["beta"], delta = params["delta"])

# perforn ks test
ks_test <- ks.test(daily_returns, "pnig", mu = params["mu"], alpha = params["alpha"], beta = params["beta"], delta = params["delta"])

print(ks_test)

#compute standadised moments at time x_t for t in a series
t=1
mean=(mu+((beta*delta)/(sqrt(alpha^2-beta^2))))*t
var=(alpha^2*delta*t)/(sqrt(alpha^2-beta^2))^3
skew=(3*beta)/(alpha*sqrt(delta*t)*(alpha^2-beta^2)^(1/4))
Excess_kurt=(3*(alpha^2+4*beta^2))/(alpha^2*delta*t*sqrt(alpha^2-beta^2))

##1 tables calculation
##we would first use the fit distribution function to fit the model to the data
#to obtain parameter estimates which would then use to calibrate the model
#if the expectation of the log ratio = 0.1 we set mu_ls=0.1 and x_0 would be the value be
#the value of the currently realised result in the series
#the inverse gaussian is not alpha sensitive and the mean scales with time
#to assess multiple periods we could loop through t
t=1
mu_ls=0.01,
expectation_ls_t=mu_ls*t
##the variance is also scaled by t
var_ls_t=var_ls*t
##the excess kurtosis is calculated from the parameters calibrated from the data
#which scales inversely with time.
Excess_kurt_ls_t=Excess_kurt_ls/t


##1b) minimal entropy cumulant generating function of my normal gaussian is given by
k <- function(u, alpha, beta, delta) {
  delta * (sqrt(alpha^2 - beta^2) - sqrt(alpha^2 - (beta + u)^2))
}
root_func <- function(omega, alpha, beta, delta) {
  k(1 - omega, alpha, beta, delta) - k(-omega, alpha, beta, delta)
}
#using a uniroot solver to solve the numerical problem
result <- uniroot(root_func, interval = c(-5, 5), alpha = alpha, beta = beta, delta = delta)

omega <- result$root

print(omega)

#variance optimal:
#First we will need to fit the distribution to the data S however we dont have enough data to do it.
#Once the data is provided it can take the place of the daily returns data. We can then estimate
#the mean and variance for the data series s. Performed function on matlab. 



