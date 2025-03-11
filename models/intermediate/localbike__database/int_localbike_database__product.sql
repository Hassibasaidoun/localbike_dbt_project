SELECT 
pr.product_id,
br.brand_name
FROM
{{ ref('stg_localbike_database__product') }} AS pr
INNER JOIN
{{ ref('stg_localbike_database__brand') }} br
ON pr.brand_id = br.brand_id

