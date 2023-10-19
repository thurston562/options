select option_symbol,stock_symbol, type, strike_price,close_price, "regularMarketLastPrice",delta,vega,expiration_date::date,reportdate::date from (
select a.symbol as stock_symbol, o.symbol as option_symbol, reportdate,expiration_date, strike_price, s."regularMarketLastPrice",s.datetime, type,close_price,delta,vega from (
select symbol, reportdate from earnings_sp500 where reportdate >  current_date and reportdate < current_date + 14) a, options_pro o, sp500 s 
where a.symbol = o.stock_symbol and a.symbol = s.symbol and days_to_expiration < 14 and (strike_price / "regularMarketLastPrice")::float > .98 and (strike_price / "regularMarketLastPrice")::float < 1.02 and s.datetime = current_date -1  and o.datetime = current_date -1  and s.datetime = o.datetime and expiration_date > current_date and "regularMarketLastPrice" < 100 and expiration_date > reportdate) as y order by regexp_replace(option_symbol,'P|C','','g'), strike_price

--select o.symbol,delta,expiration_date,strike_price,"closePrice"  from options_pro o, sp500 s where type = 'CALL' and o.datetime = current_date and s.datetime = current_date and (strike_price / "closePrice")::float > .98 and (strike_price / "closePrice")::float < 1.02 and stock_symbol = s.symbol and days_to_expiration < 8 ;


