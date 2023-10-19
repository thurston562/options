--regularMarketLastPrice

SELECT symbol,datetime,  
       AVG("regularMarketLastPrice")
            OVER(partition by symbol ORDER BY symbol,datetime ROWS BETWEEN 199 PRECEDING AND CURRENT ROW) AS avg_price,"regularMarketLastPrice"
FROM sp500 
order by symbol,datetime
 
