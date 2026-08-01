
     -- Q1 A single result set showing each order status, its count, and its percentage of total orders.
     select order_status,count(*) As totalorders, count(*)*100.0/
     (select count(*) from orders
     where year(order_date)=2023)as percentage
     from orders
     where year(order_date)=2023
     group by order_status;
     
     
     -- Q2 For each city, show total orders, delivered orders, and cancelled orders. Sort by total orders descending.
	
     select city,count(*) as totalorders,
     sum(
     case when order_status ="delivered"
     then 1 else 0
     end ) as deliveredorders,
     sum( case when order_status ="cancelled"
     then 1 else 0
     end) as cancelledorders
     from orders 
     group by city
     order by  totalorders desc;
     
    -- Q3 promo and non-promo orders, each with order count and average order value
    select case when promo_code is null or trim(promo_code)=""
    then "nopromo"
    else"promo"
    end as promotype,
    count(*) as totalorders,
    avg(net_order_value)
    from orders
    group by promotype;
          
-- Q4 of orders by channel — App, Web, Kiosk. For each channel, show order count, total net revenue, 
 --                            and average net revenue per order

select `channel`,
count(*) as totalorders,
sum(net_order_value) as totalrevenue,
avg(net_order_value) as avg_net_revenue
from orders
group by `channel`
order by totalrevenue desc;

-- Q5 for each membership tier — Platinum, Gold, Silver, None — the total number of customers, 
  --                        how many of them actually placed at least one order in 2023, 
 --                    the total net revenue they generated, and the average net order value per order.


-- left join beacuse customers with zero orders must appear
select membership_tier,count(distinct customers.customer_id)as Totalcustomers,
                       count(distinct orders.customer_id) as customers_with_orders,
                       round(sum(net_order_value),2) as totalrevenue,
                      round(avg(net_order_value),2) as avg_order_value
				from customers 
                left join orders on customers.customer_id=orders.customer_id
                and year(order_date)=2023
                group by membership_tier;
			
-- Q6 Give me net revenue by month for 2023, along with the order count per month
    select order_month,
        count(*)as totalorders,
        sum(net_order_value) as totalrevenue
 from orders
 where year(order_date)= 2023
 group by order_month
 order by totalrevenue desc;

-- 7 -- total orders, delivered count, cancelled count, returned count, total gross revenue, 
 --              total promo discounts given, and total net revenue. 
 
 select `channel`,
     count(*) as Total_orders,
     sum(case when order_status='delivered' then 1 else 0 end) as delivered_orders,
     sum(case when order_status ='cancelled' then 1 else 0 end)as cancelled_orders,
     sum(case when order_status = 'returned' then 1 else 0 end) as returned_orders,
  sum(gross_order_value) as total_gross_revenue,
  sum(promo_discount_amt) as total_promo_discount, 
  sum(net_order_value) as total_net_revenue
  from orders
  group by `channel`;
  
  -- 8-(Perishable / Non-Perishable) with total lines, returned lines, and return percentage.
  
  select 
  case when p.is_perishable=1 then 'perishable' else 'non-perishable'
      end as Product_type,
      count(*) as total_lines,
      sum(case when oi.item_return_flag=1 then 1 else 0 end)as returned_lines,
      sum(case when oi.item_return_flag =1 then 1 else 0 end)*100/count(*) as return_percentage
      from order_items oi 
      join products p
      on oi.product_id=p.product_id
      group by Product_type;
      

 