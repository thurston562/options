select description,b.symbol,gics_sector,count(*) over (partition by gics_sector),gisc_sub_sector,"52WkHigh","regularMarketLastPrice" from sp500 b,companies_sp500 a where ("regularMarketLastPrice"/"52WkHigh") > .90 and "regularMarketLastPrice" <> 0 and a.symbol = b.symbol and datetime = current_date  order by count desc,gics_sector;


