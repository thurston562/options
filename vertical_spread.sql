 select * from (
select stock_symbol,
       symbol,
       expiration_date,
       strike_price,
       bid,
       ask,
       delta,
       bid - case when (lead(expiration_date::date) over (partition by stock_symbol order by stock_symbol, expiration_date::date, strike_price) = expiration_date::date)                  then lead(ask) over (partition by stock_symbol order by stock_symbol,expiration_date::date ,strike_price)::float else 0 end  as premium,
       case when (lead(expiration_date) over (partition by stock_symbol order by stock_symbol,expiration_date::date,strike_price) = expiration_date) then lead(strike_price) over (partition by stock_symbol order by stock_symbol,expiration_date::date,strike_price) - strike_price else 0 end as interval 

from options_pro where type = 'CALL' and datetime = current_date   and expiration_date::date - current_date < 14) as opts   order by stock_symbol,expiration_date,strike_price;
