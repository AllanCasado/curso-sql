--4.1 Cria uma consulta que liste a categoria, o preço do produto 
--e classificação de cada produto dentro da sua categoria
--do mais caro ao mais barato, a partir do dia 01 de Junho de 2018.
SELECT
	o.order_purchase_timestamp AS data,
	oi.product_id AS id,
	p.product_category_name AS categoria,
	oi.price AS preco,
	DENSE_RANK() OVER (PARTITION BY p.product_category_name 
					   ORDER BY oi.price DESC) AS rank
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
					LEFT JOIN orders o   ON oi.order_id = o.order_id 
WHERE p.product_category_name IS NOT NULL
	AND DATE(o.order_purchase_timestamp) > '2018-06-01'
	
	
-- 4.2 Crie uma consulta que exiba a data de compra, 
--o valor de cada venda e o total acumulado de vendas até aquela data.
SELECT
	DATE(order_purchase_timestamp) AS data,
	oi.price AS preco,
	SUM(oi.price) OVER (ORDER BY o.order_purchase_timestamp ASC
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS soma_acumulada
FROM order_items oi  LEFT JOIN orders o ON o.order_id = oi.order_id 


--4.3 Crie uma consulta que exiba a data de compra, o valor de cada 
-- venda e a média móvel dos últimos três valores de venda incluindo o valor atual
SELECT
	DATE(o.order_purchase_timestamp) AS data,
	oi.price AS preco,
	AVG(oi.price) OVER (ORDER BY o.order_purchase_timestamp ASC
						ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS media_3_dias
FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id 


--4.4 Crie uma consulta que lista a data da compra, o número de 
--produtos vendidos e o crescimento das vendas com relação ao dia anterior.
SELECT
	DATE(o.order_purchase_timestamp) AS data,
	COUNT(oi.product_id) AS qtd_produtos,
	SUM(oi.price)  OVER (PARTITION BY DATE(o.order_purchase_timestamp)) AS vendas_hoje,
	m.dia_anterior,
	(total_vendas/m.dia_anterior) AS crescimento
FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id 
					LEFT JOIN (SELECT
									DATE(o.order_purchase_timestamp) AS data_compra,
									SUM(oi.price) AS total_vendas,
									LAG(SUM(oi.price)) OVER(ORDER BY o.order_purchase_timestamp) AS dia_anterior
							   FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id 
							   GROUP BY DATE(o.order_purchase_timestamp)) AS m ON DATE(o.order_purchase_timestamp) = m.data_compra
GROUP BY DATE(o.order_purchase_timestamp)
							   

--4.5 Crie uma consulta que exiba o estado do cliente, a categoria, 
--a quantidade de produtos vendidos e o percentual de vendas em relação ao total vendido no estado.
SELECT
	c.customer_state AS c_state,
	p.product_category_name AS categoria,
	oi.price,
	COUNT(oi.product_id) OVER (PARTITION BY c.customer_state) AS qtd_produtos,
	SUM(oi.price) OVER (PARTITION BY c.customer_state) AS total_vendas,
	SUM(oi.price) OVER (PARTITION BY c.customer_state
						ORDER BY oi.price ASC
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_ate_o_momento,
	SUM(oi.price) OVER (PARTITION BY c.customer_state
						ORDER BY oi.price ASC
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) / SUM(oi.price) OVER (PARTITION BY c.customer_state) AS percentual_do_total
FROM order_items oi LEFT JOIN orders o   ON oi.order_id = o.order_id 
					LEFT JOIN customer c ON o.customer_id = c.customer_id 
					LEFT JOIN products p ON oi.product_id = p.product_id 
WHERE p.product_category_name IS NOT NULL









