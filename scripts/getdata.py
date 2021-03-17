import numpy as np
import pandas as pd
from pandas_datareader import data as wb

def getdata(tickers):
    ind_data = pd.DataFrame()
    for ticker in tickers:
        ind_data[ticker] = wb.DataReader(ticker, data_source='yahoo', start='2012-04-1')['Adj Close']
    return ind_data
