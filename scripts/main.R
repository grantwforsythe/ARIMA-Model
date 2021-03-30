library(BatchGetSymbols)  # market data
library(lmtest)  # testing coefficients
library(xts)  # ts

## Getting Data

first.date <- "2020-11-29"
last.date <- "2021-03-29"
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
     ylab = "Adjusted Open Prices")

usa_open_diff <- diff(usa_open)

plot(usa_open_diff,
     type = "o",
     ylab = "First Difference")

abline(h=0)

plot(diff(usa_open_diff),
     type="o",
     ylab = "Second Difference")

abline(h=0)

acf(usa_open, main = "")
acf(usa_open_diff, main = "")
pacf(usa_open_diff, main = "")
TSA::eacf(usa_open)

## Model Fitting

model <- arima(usa_open, 
                  order=c(1,1,1))
print(model)
coeftest(model)

plot(model,
     n.ahead=10,
     col="black")

## Residuals

res <-rstandard(model)

plot(res,
     ylab="Standardized residuals",
     type="o")
abline(h=0)

qqnorm(res, main = "")
qqline(res)

acf(res, main="")

shapiro.test(res)
TSA::LB.test(model,lag=6)

# Forecast
plot(model,
     type="o",
     n.ahead=10,
     col="red",
     ylab="Adjusted Open Price")