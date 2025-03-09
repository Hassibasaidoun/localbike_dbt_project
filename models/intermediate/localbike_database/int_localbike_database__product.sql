SELECT 
pr.product_id,
pr.product_name,
pr.brand_id,
pr.category_id,
pr.model_year,
pr.list_price,
br.brand_id,
br.brand_name,
cat.category_id,
cat.category_name,
st.store_id,
coalesce(st.quantity,0)
FROM
{{ ref('stg_localbike_database__product') }} AS pr
INNER JOIN
{{ ref('stg_localbike_database__brand') }} br
ON pr.brand_id = br.brand_id
INNER JOIN
{{ ref('stg_localbike_database__category') }} cat
ON pr.category_id = cat.category_id
LEFT JOIN
{{ ref('stg_localbike_database__stock') }} st
ON pr.product_id = st.product_id