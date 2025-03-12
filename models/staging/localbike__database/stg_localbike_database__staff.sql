select
staff_id	,
first_name	,
last_name	,
email	,
phone	,
active,
store_id,	
case when manager_id = 'NULL' THEN null else manager_id end as manager_id
from {{ source('localbike__database', 'staffs') }}
