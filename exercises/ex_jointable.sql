SELECT *
FROM orders o LEFT JOIN order_items oi ON (o.order_id = oi.order_id)
			  LEFT JOIN customer c     ON (o.customer_id = c.customer_id 
			  
SELECT 
	order_id,
	COUNT(order_id)
FROM order_payments op 
GROUP BY order_id 
HAVING COUNT(order_id) > 1

SELECT *
FROM orders o LEFT JOIN order_payments op ON (o.order_id = op.order_id)
WHERE o.order_id  = "0016dfedd97fc2950e388d2971d718c7"
			  




