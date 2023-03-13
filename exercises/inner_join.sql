SELECT
customer_id,
	COUNT(order_id) AS cnt
FROM orders o 
GROUP BY customer_id


SELECT
	order_id,
	COUNT(order_item_id) AS cnt
FROM order_items oi 
GROUP BY order_id 
ORDER BY cnt DESC

SELECT
	oi.order_id,
	oi.product_id,
	oi.order_item_id,
	p.product_category_name,
	p.product_description_lenght,
	p.product_name_lenght  
FROM order_items oi 
INNER JOIN products p 
ON (oi.product_id = p.product_id)

SELECT *
FROM order_items oi 
WHERE order_id = "0008288aa423d2a3f00fcb17cd7d8719"

SELECT
	o.order_id,
	o.customer_id,
	o.order_status,
	oi.product_id,
	p.product_category_name,
	oi.price 
FROM orders o 
INNER JOIN order_items oi 
ON (o.order_id = oi.order_id)
INNER JOIN products p
ON (oi.product_id = p.product_id)
WHERE o.order_id  = "0008288aa423d2a3f00fcb17cd7d8719"
