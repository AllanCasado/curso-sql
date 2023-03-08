/* 1. Qual o número de clientes únicos de todos os estados? */
SELECT 
	c.customer_state AS estado,
	COUNT(DISTINCT c.customer_id) AS numero_clientes
FROM customer c 
GROUP BY c.customer_state 

/* 2. Qual o número de cidades únicas de todos os estados? */
SELECT
	g.geolocation_state AS estado,
	COUNT(DISTINCT g.geolocation_city) AS numero_cidades
FROM geolocation g 
GROUP BY g.geolocation_state 

/* 3. Qual o número de clientes únicos por estado e por
cidade? */
SELECT 
	c.customer_state AS estado,
	c.customer_city AS cidade,
	COUNT(DISTINCT c.customer_id) AS numero_pessoas
FROM customer c 
GROUP BY c.customer_state, c.customer_city

/* 4. Qual o número de clientes únicos por cidade e por
estado? */
SELECT
	c.customer_city AS cidade,
	c.customer_state AS estado,
	COUNT(DISTINCT c.customer_id) AS numero_pessoas
FROM customer c
GROUP BY c.customer_city, c.customer_state

/* 5. Qual o número total de pedidos únicos acima de R$
3.500 por cada vendedor? */
SELECT
	oi.seller_id,
	COUNT(DISTINCT oi.order_id)
FROM order_items oi 
WHERE price > 3500
GROUP BY oi.seller_id 

/* 6. Qual o número total de pedidos únicos, a data mínima e
máxima de envio, o valor máximo, mínimo e médio do frete 
dos pedidos acima de R$ 1.100 por cada vendedor? */
SELECT
	oi.seller_id,
	COUNT(DISTINCT oi.order_id) AS numero_pedidos,
	MIN(oi.shipping_limit_date) AS data_minima,
	MAX(oi.shipping_limit_date) AS data_maxima,
	MAX(oi.freight_value) AS frete_maximo,
	MIN(oi.freight_value) AS frete_minimo,
	AVG(oi.freight_value) AS frete_medio
FROM order_items oi
WHERE oi.price > 1100
GROUP BY oi.seller_id
ORDER BY numero_pedidos DESC

/* 7. Qual o valor médio, máximo e mínimo do preço de todos
os pedidos de cada produto? */
SELECT
	product_id,
	COUNT(DISTINCT order_id) AS qnt_pedidos,
	AVG(price) AS media,
	MAX(price) AS maximo,
	MIN(price) AS minimo
FROM order_items oi 
GROUP BY product_id
ORDER BY qnt_pedidos DESC

/* 8. Qual a quantidade de vendedores distintos que
receberam algum pedido antes do dia 23 de setembro de
2016 e qual foi o preço médio desses pedidos? */

/* 9. Qual a quantidade de pedidos por tipo de pagamentos? */
SELECT
	op.payment_type AS tipo_pagamento,
	COUNT(DISTINCT op.order_id) AS qt_pagamentos
FROM order_payments op
GROUP BY op.payment_type
ORDER BY qt_pagamentos DESC

/* 10. Qual a quantidade de pedidos, a média do valor do
pagamento e o número máximo de parcelas por tipo de
pagamentos? */
SELECT
	payment_type AS tipo_pagamento,
	COUNT(DISTINCT order_id) AS qt_pagamentos,
	AVG(op.payment_value) AS media_pagamento,
	MAX(op.payment_installments) AS maximo_parcelas
FROM order_payments op 
GROUP BY op.payment_type
ORDER BY qt_pagamentos DESC

/* 11. Qual a valor mínimo, máximo, médio e as soma total
paga por cada tipo de pagamento e número de parcelas
disponíveis? */
SELECT
	payment_type,
	payment_installments,
	MIN(op.payment_value) AS minimo,
	MAX(op.payment_value) AS maximo,
	AVG(op.payment_value) AS media,
	SUM(op.payment_value) AS soma
FROM order_payments op
GROUP BY op.payment_type, op.payment_installments 

/* 12. Qual a média de pedidos por cliente? */
SELECT
	customer_id,
	COUNT(DISTINCT order_id) AS qt_pedidos
FROM orders o 
GROUP BY customer_id 
ORDER BY qt_pedidos DESC

/* 13. Qual a quantidade de pedidos realizados por cada
status do pedido, a partir do dia 23 de Setembro de 2016? */
SELECT
	order_status,
	COUNT(DISTINCT order_id) AS pedidos
FROM orders o 
WHERE order_approved_at > '2016-09-23 00:00:00'
GROUP BY order_status 
ORDER BY pedidos DESC

/* 14. Qual a quantidade de pedidos realizados por dia, a
partir do dia 23 de Setembro de 2016? */
SELECT
	DATE (order_approved_at),
	COUNT(DISTINCT order_id) AS pedidos
FROM orders o 
WHERE order_approved_at > '2016-09-23 00:00:00'
GROUP BY DATE (order_approved_at) 
ORDER BY pedidos DESC

/* 15. Quantos produtos estão cadastrados na empresa por
categoria? */
SELECT
	product_category_name,
	COUNT(DISTINCT product_id)
FROM products p
GROUP BY p.product_category_name 