--4.1 Crie uma consulta SQL usando a cláusula WITH para calcular o 
--total de vendas para cada categoria e exiba o resultado
WITH vendas_por_categoria AS (
	SELECT
		p.product_category_name,
		ROUND(SUM(oi.price), 2) AS vendas_por_categoria
	FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
	GROUP BY p.product_category_name 
)

--4.2 Crie uma consulta usando a cláusula WITH para calcular a 
--receita total por mês e exiba o mês com a maior receita.
WITH vendas_por_mes AS (
	SELECT
		STRFTIME('%m', o.order_purchase_timestamp) AS mes,
		SUM(oi.price) AS vendas
	FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id 
	GROUP BY STRFTIME('%m', o.order_purchase_timestamp)
)
SELECT *
FROM vendas_por_mes vm
WHERE vm.vendas = (SELECT MAX(vm.vendas) FROM vendas_por_mes vm)


--4.3 Crie uma consulta usando duas cláusulas WITH para calcular o 
--total de vendas por estado e, em seguida, por cidade, e exiba os resultados
WITH vendas_estado AS (
	SELECT
		c.customer_state as estado,
		ROUND(SUM(oi.price), 2) as vendas
	FROM order_items oi LEFT JOIN orders o   ON oi.order_id = o.order_id 
						LEFT JOIN customer c ON o.customer_id = c.customer_id
	GROUP BY c.customer_state 
), vendas_cidade AS (
	SELECT
		c.customer_city as cidade,
		c.customer_state as estado,
		ROUND(SUM(oi.price), 2) as vendas
	FROM order_items oi LEFT JOIN orders o   ON oi.order_id = o.order_id 
						LEFT JOIN customer c ON o.customer_id = c.customer_id
	GROUP BY c.customer_city 
)
SELECT
	ve.estado,
	ve.vendas AS vendas_estado,
	vc.cidade,
	vc.vendas AS vendas_cidade
FROM vendas_estado ve LEFT JOIN vendas_cidade vc ON ve.estado = vc.estado
ORDER BY ve.vendas DESC


--4.4 Crie uma consulta SQL com as seguintes colunas: 1) Categoria, 2)Preço, 3)Date limite de envio, 4) Primeira
--compra, 5) Número de dias que o produto foi comprado a partir da primeira compra dentro da mesma categoria.
WITH infos AS (
	SELECT
		oi.order_id, 
		p.product_category_name AS categoria,
		oi.price AS preco,
		DATE(oi.shipping_limit_date) AS data_limite,
		DATE(o.order_purchase_timestamp) AS data_compra,
		FIRST_VALUE(DATE(o.order_purchase_timestamp)) OVER (PARTITION BY p.product_category_name ORDER BY DATE(o.order_purchase_timestamp)) AS primeira_compra
	FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
						LEFT JOIN orders o   ON oi.order_id = o.order_id 
	WHERE p.product_category_name IS NOT NULL
)
SELECT
	order_id,
	categoria,
	preco,
	data_limite,
	data_compra,
	primeira_compra,
	CAST(JULIANDAY(data_compra) - JULIANDAY(primeira_compra) AS INTEGER) AS diferenca_dias
FROM infos













