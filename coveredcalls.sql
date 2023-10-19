select s.symbol, "regularMarketLastPrice",returnonequity,dividendyield,ltdebttoequity,totaldebttoequity from sp500 s,fundamental_pro f where s.symbol = f.symbol and s.datetime = current_date and f.datetime = current_date and "regularMarketLastPrice"  between 20 and 60 and returnonequity > 15 and dividendyield between 2.5 and 5;

