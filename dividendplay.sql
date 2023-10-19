select s.symbol,s."regularMarketLastPrice",dividenddate,dividendpaydate,dividendpayamount,dividendpayamount/"regularMarketLastPrice" as yield from fundamental_pro f, sp500 s where s.datetime = current_date and dividenddate::date > current_date and dividenddate <> ' ' and dividendpaydate::date < current_date + 30 and s.datetime = f.datetime and f.symbol = s.symbol order by yield desc;

