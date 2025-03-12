select 
    ord.order_date,
    ord.order_date_year,
    ord.order_date_month,
    ord.city,
    ord.state,
    ord.store_name,
    pr.category_name, 
    pr.product_name,
    pr.brand_name,
    count(ord.order_id) as total_orders,
    sum(ord.item_quantity) as total_item_quantity,
    sum(ord.total_order_item_amount) as total_order_item_amount,
    avg(ord.total_order_item_amount) as avg_order_amount
FROM 
{{ ref('int_localbike_database__order') }} AS ord
INNER JOIN {{ ref('int_localbike_database__product') }} as pr
ON ( ord.product_id = pr.product_id 
and ord.store_id = pr.store_id )
group by 
   ord.order_date,
    ord.order_date_year,
    ord.order_date_month,
    ord.city,
    ord.state,
    ord.store_name,
    pr.category_name,
    pr.product_name,
    pr.brand_name