--LAG()
-- desloca a coluna p frente
SELECT
	o.customer_id,
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	LAG(oi.shipping_limit_date) OVER (PARTITION BY p.product_category_name
	 								  ORDER BY oi.shipping_limit_date) AS date_shift
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
					LEFT JOIN orders o   ON oi.order_id = o.order_id 
WHERE p.product_category_name IS NOT NULL


--LEAD()
-- recua a coluna 
SELECT
	o.customer_id,
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	LEAD(oi.shipping_limit_date) OVER (PARTITION BY p.product_category_name
	 								  ORDER BY oi.shipping_limit_date) AS date_shift
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
					LEFT JOIN orders o   ON oi.order_id = o.order_id 
WHERE p.product_category_name IS NOT NULL


--FIRST_VALUE()
SELECT
	o.customer_id,
	p.product_category_name,
	oi.price,
	oi.shipping_limit_date,
	FIRST_VALUE(oi.shipping_limit_date) OVER (PARTITION BY p.product_category_name
	 								  ORDER BY oi.shipping_limit_date) AS date_shift
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
					LEFT JOIN orders o   ON oi.order_id = o.order_id 
WHERE p.product_category_name IS NOT NULL
