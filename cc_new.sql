select a.symbol,"regularMarketLastPrice",strike_price,expiration_date::date, b.bid, 100 * "regularMarketLastPrice" - (100 * bid) as cost,bid /"regularMarketLastPrice" as value
from sp500 a,options_pro b 
where a.datetime = current_date and b.datetime = current_date and strike_price > (1.05 * "regularMarketLastPrice") and strike_price < (1.15 * "regularMarketLastPrice") and type ilike 'call'
and days_to_expiration < 14 and stock_symbol = a.symbol and bid <>0 and (100 * "regularMarketLastPrice") - (100 * bid) < 100000
group by 1,2,3,4,5,6,7
order by value desc

