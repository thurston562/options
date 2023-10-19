
select b.symbol,average_close, "regularMarketLastPrice",average_close - "regularMarketLastPrice" as diff,"regularMarketLastPrice"/average_close as percent,nov_close, gics_sector, gisc_sub_sector
from 
companies_sp500 d,
(select close as nov_close,symbol from historical_sp500 where  stock_date = '2019-11-1'::date) c , 
(select symbol,avg(close) as average_close,avg(volume) as average_volume from historical_sp500 group by 1) a, 
sp500 b 
where 
a.symbol = b.symbol and c.symbol = b.symbol and d.symbol = b.symbol and datetime = current_date and nov_close > average_close and (average_close - "regularMarketLastPrice") > 0 order by percent;
