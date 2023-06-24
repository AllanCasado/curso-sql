--FAZENDO COM GROUP BY E SUBQUERIES
SELECT 
	DISTINCT t.product_id,
	t.product_category_name,
	t.price,
	t.media_categoria
FROM (order_items oi2 LEFT JOIN products p2 ON oi2.product_id = p2.product_id 
					 LEFT JOIN (SELECT
									p.product_category_name,
									AVG(oi.price) AS media_categoria
								 FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id
								 GROUP BY p.product_category_name
								 HAVING p.product_category_name IS NOT NULL) AS medias ON p2.product_category_name = medias.product_category_name) AS t
WHERE t.product_category_name IS NOT NULL
ORDER BY t.product_category_name, t.product_id 			

--FAZENDO COM WINDOW FUNCTION
SELECT DISTINCT oi.product_id, 
	   p.product_category_name,
	   oi.price,
	   AVG(oi.price) OVER (PARTITION BY p.product_category_name) AS media_categoria
FROM order_items oi LEFT JOIN products p ON oi.product_id  = p.product_id
WHERE p.product_category_name IS NOT NULL
ORDER BY p.product_category_name, oi.product_id