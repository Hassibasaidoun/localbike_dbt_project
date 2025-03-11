SELECT 
br.brand_name,
cat.category_name,
st.store_id,
sum(pr.list_price),
sum(coalesce(st.quantity,0)),
sum(coalesce(st.quantity,0) * pr.list_price ) total_cost
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
group by 
br.brand_name,
cat.category_name,
st.store_id