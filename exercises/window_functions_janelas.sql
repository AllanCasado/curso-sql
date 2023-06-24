-- cada linha que eu pegar em media_7_dias é a média
-- do preço das compras dos ultimos 7 dias, incluindo a current row
SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG(oi.price) OVER (ORDER BY o.order_purchase_timestamp
						ROWS BETWEEN 7 PRECEDING AND CURRENT ROW) AS media_7_dias
FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id 

-- cada linha que eu pegar em media_7_dias é a média
-- do preço das compras dos ultimos 7 dias, NÃO incluindo a current row
SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG(oi.price) OVER (ORDER BY o.order_purchase_timestamp
						ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING) AS media_7_dias
FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id 


-- cada linha que eu pegar em media_5_dias é a média
-- do preço das compras dos ultimos 3 dias + o dia atual + os proximos 2 dias
SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG(oi.price) OVER (ORDER BY o.order_purchase_timestamp
						ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING) AS media_5_dias
FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id 


-- pega histórica a media ate aquele dia 
SELECT
	o.order_purchase_timestamp,
	oi.price,
	AVG(oi.price) OVER (ORDER BY o.order_purchase_timestamp ASC
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS media_5_dias
FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id


-- cada linha que eu pegar em media_7_dias é a média
-- do preço das compras dos ultimos 7 dias, NÃO incluindo a current row
-- compara a media dos ultimos 7 compras com a media do dia
SELECT
    DATE(o.order_purchase_timestamp) AS data,
    oi.price,
    m.media_dia,
    AVG(oi.price) OVER (ORDER BY o.order_purchase_timestamp
                        ROWS BETWEEN 7 PRECEDING AND 1 PRECEDING) AS media_7_dias
FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id
					LEFT JOIN (SELECT
							     DATE(o2.order_purchase_timestamp) AS data_dia,
								 AVG(oi2.price) AS media_dia
							  FROM order_items oi2 LEFT JOIN orders o2 ON oi2.order_id = o2.order_id 
							  GROUP BY DATE(o2.order_purchase_timestamp)) AS m ON m.data_dia = DATE(o.order_purchase_timestamp)



