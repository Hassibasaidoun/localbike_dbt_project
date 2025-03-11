select order_id,
ord.order_date, 
year(ord.order_date) as order_date_year, 
month(ord.order_date) as order_date_month, 
odr.order_status,
odr.required_date,
odr.shipped_date,
c.city, 
c.satate, 
s.store_name,
st.first_name,
st.last_name,
item_quantity,
total_order_item_amount,
from 
{{ ref('stg_localbike_database__order') }} AS odr
INNER JOIN
{{ ref('stg_localbike_database__order_item') }} itm
ON odr.order_id = itm.order_id
INNER JOIN
{{ ref('stg_localbike_database__customer') }} c
ON odr.customer_id = c.customer_id
INNER JOIN
{{ ref('stg_localbike_database__store') }} s
ON odr.store_id = s.store_id
LEFT JOIN
{{ ref('stg_localbike_database__staff') }} st
ON ord.staff_id = st.sttaf_id
