select a.symbol,low52,"regularMarketLastPrice",high52,(high52 + low52) / 2 as avg_highlow,"regularMarketLastPrice" - (high52 + low52) / 2 as diff,
"regularMarketLastPrice" / ("regularMarketLastPrice" - (high52 + low52) / 2)  as relative_diff

 from fundamental_pro b join sp500 a on (a.symbol = b.symbol and a.datetime = b.datetime) where a.datetime = current_date   and "regularMarketLastPrice" < (high52 + low52) / 2  order by relative_diff desc
