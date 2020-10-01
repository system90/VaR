# VAR and CVAR in R
# 01/10/2020 

library(quantmod)
library(PerformanceAnalytics)

maxDate <- "2010-01-01"
MSFT.prices <- Ad(getSymbols("MSFT", auto.assign = F, from=maxDate))  # just want adjusted close prices
MSFT.prices

MSFT.rets <- dailyReturn(BRY.prices)           # Calculate daily returns
VaR(MSFT.rets, p=0.95, method = "historical")   # 95th percentile for VaR
VaR(MSFT.rets, p=0.99, method = "historical")   # 99th percentile for VaR

CVaR(MSFT.rets, p=0.95, method = "historical")  # 95th percentile for CVaR
CVaR(MSFT.rets, p=0.99, method = "historical")  # 99th percentile for CVaR

 
# Portfolio of stocks
tickers <- c("MSFT", "LONE", "USEG")            # vector of stocks
weights <- c(0.50, 0.10, 0.40)                # Individual weightings for each stock of portfolio
getSymbols(tickers, from=maxDate)

Port.prices <- (merge(Ad(MSFT), Ad(LONE), Ad(USEG)))     # Getting the Adjusted closes
Port.prices
head(Port.prices)
Port.returns <- ROC(Port.prices, type="discrete")               # ROC: Rate of change (also getting rid of first row, as it contains NA's)
colnames(Port.returns) <- tickers                               # renaming the headers
head(Port.returns)                                              # Returns for each of the stocks



