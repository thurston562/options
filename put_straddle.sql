select option_symbol,stock_symbol, type, strike_price,close_price, "regularMarketLastPrice",delta,vega,expiration_date::date from (
select s.symbol as stock_symbol, o.symbol as option_symbol, expiration_date, strike_price, s."regularMarketLastPrice",s.datetime, type,close_price,delta,vega from  options_pro o, sp500 s 
where type = 'PUT' and s.symbol = o.stock_symbol and days_to_expiration < 15 and days_to_expiration > 2 and (strike_price / "regularMarketLastPrice")::float > .50 and (strike_price / "regularMarketLastPrice")::float < .91 and s.datetime = current_date -1  and o.datetime = current_date -1  and s.datetime = o.datetime and expiration_date > current_date and "regularMarketLastPrice" < 100 and (close_price / "regularMarketLastPrice")::float > .01 ) as y 
order by regexp_replace(option_symbol,'P|C','','g'), strike_price



