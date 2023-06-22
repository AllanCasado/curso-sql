CASE WHEN

Criar colunas com base em determinada condição.

SELECT
	oi.price,
	CASE WHEN oi.price < 20 THEN 'super_barato'
	     WHEN oi.price < 100 THEN 'barato'
	     WHEN oi.price > 150 AND oi.price < 180 THEN 'normal'
	ELSE 'caro' END AS status
FROM order_items oi
