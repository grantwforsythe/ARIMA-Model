library(BatchGetSymbols)  # market data
library(lmtest)  # testing coefficients
library(xts)  # ts

## Getting Data

first.date <- Sys.Date() - 200 
last.date <- Sys.Date()
freq.data <- 'daily'

usa <- BatchGetSymbols(tickers = "^gspc", 
                          first.date = first.date,
                          last.date = last.date, 
                          freq.data = freq.data,
                          cache.folder = file.path(tempdir(), 
                                                   'BGS_Cache') 
                       )

usa_open<-as.ts(usa$df.tickers$price.open)

## Plots

plot(usa_open, 
     type = "o",
     ylab = "S&P 500 Open Prices")

usa_open_diff <- diff(usa_open)

first_diff_mod<-lm(usa_open_diff~time(usa_open_diff))

plot(usa_open_diff,
     type = "o",
     ylab = "First Difference")

abline(first_diff_mod)

plot(diff(usa_open_diff),
     type="o",
     ylab = "Second Difference")

abline(h=0)

acf(usa_open, main = "")
acf(usa_open_diff, main = "")
pacf(usa_open_diff, main = "")

## Model Fitting

fitARIMA.1 <- arima(usa_open, 
                  order=c(1,1,1))
print(fitARIMA.1)
coeftest(fitARIMA.1)

fitARIMA.2 <- arima(usa_open, 
                  order=c(2,1,1))
print(fitARIMA.2)
coeftest(fitARIMA.2) 

fitARIMA.3 <- arima(usa_open, 
                  order=c(2,1,2))
print(fitARIMA.3)
coeftest(fitARIMA.3) 

## Residuals

res <-fitARIMA.1$residuals

acf(res, main = "Residuals")
qqnorm(res, main = "")
qqline(res)