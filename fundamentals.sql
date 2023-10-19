select f.symbol,peratio,pegratio,prratio,pbratio,bookvaluepershare,high52,low52,"regularMarketLastPrice","regularMarketLastPrice"/high52 as close_to_high,low52/"regularMarketLastPrice" as close_to_low,"regularMarketLastPrice"/high52 - low52/"regularMarketLastPrice" as price_gauge from fundamental_pro f, sp500 s where s.symbol = f.symbol and f.datetime = current_date -2 and s.datetime = f.datetime order by price_gauge asc;
