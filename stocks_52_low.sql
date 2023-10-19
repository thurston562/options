select description,b.symbol,gics_sector,count(*) over (partition by gics_sector),gisc_sub_sector,"52WkLow","regularMarketLastPrice" from sp500 b,companies_sp500 a where ("52WkLow"/"regularMarketLastPrice") > .90 and "regularMarketLastPrice" <> 0 and a.symbol = b.symbol and datetime = current_date - :daysback   order by count desc,gics_sector;


