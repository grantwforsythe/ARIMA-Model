import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from pandas_datareader import data as wb

def getdata(tickers):
    ind_data = pd.DataFrame()
    for t in tickers:
        ind_data[t] = wb.DataReader(t,data_source='yahoo',start='2012-04-1')['Adj Close']
    return ind_data
  
  if __name__ == '__main__':
    tickers = ['^GSPC','^N225', 'VUKE.L']
    ind_data = getdata(tickers)
    ind_data.to_csv('..\data_raw\ind_data', index=True)
