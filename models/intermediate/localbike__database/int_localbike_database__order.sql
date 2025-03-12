select ord.order_id, 
ord.order_date, 
EXTRACT(YEAR FROM ord.order_date) as order_date_year, 
EXTRACT(MONTH FROM ord.order_date) as order_date_month, 
ord.order_status,
ord.required_date,
ord.shipped_date,
c.city, 
c.state, 
s.store_name,
ord.store_id,
staff.first_name,
staff.last_name,
itm.product_id,
itm.item_quantity,
itm.total_order_item_amount
FROM
{{ ref('stg_localbike_database__order') }} AS ord
INNER JOIN
{{ ref('stg_localbike_database__order_item') }} itm
ON ord.order_id = itm.order_id
INNER JOIN
{{ ref('stg_localbike_database__customer') }} c
ON ord.customer_id = c.customer_id
INNER JOIN
{{ ref('stg_localbike_database__store') }} s
ON ord.store_id = s.store_id
LEFT JOIN
{{ ref('stg_localbike_database__staff') }} staff
ON ord.staff_id = staff.staff_id