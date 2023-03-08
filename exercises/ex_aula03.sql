/* Qual o número de clientes únicos do estado de Minas Gerais? */
SELECT 
	COUNT(c.customer_id)
FROM 
	customer AS c
WHERE 
	c.customer_state = "MG"

/* Qual a quantidade de cidades únicas dos vendedores do
estado de Santa Catarina? */
SELECT
	COUNT (DISTINCT g.geolocation_city) 
FROM 
	geolocation g 
WHERE 
	g.geolocation_state = "SC"

/* Qual a quantidade de cidades únicas de todos os vendedores
da base? */
SELECT 
	COUNT (DISTINCT g.geolocation_city)
FROM 
	geolocation g 

/* Qual o número total de pedidos únicos acima de R$ 3.500 */
SELECT
	COUNT(oi.order_id)
FROM
	order_items oi 
WHERE
	oi.price > 3500

/* Qual o valor médio do preço de todos os pedidos? */
SELECT
	AVG(oi.price)
FROM 
	order_items oi 

/* Qual o maior valor de preço entre todos os pedidos? */
SELECT
	MAX(oi.price)
FROM 
	order_items oi 
	
/* Qual o menor valor de preço entre todos os pedidos? */
SELECT
	MIN(oi.price)
FROM 
	order_items oi 
	
/* Qual a quantidade de produtos distintos vendidos abaixo do
preço de R$ 100.00? */
SELECT
	COUNT (DISTINCT oi.product_id)
FROM 
	order_items oi 
WHERE 
	oi.price < 100

/* Qual a quantidade de vendedores distintos que receberam
algum pedido antes do dia 23 de setembro de 2016? */
SELECT
	COUNT (oi.seller_id)
FROM
	order_items oi 
WHERE
	oi.shipping_limit_date < '2016-09-23'

/* Quais os tipos de pagamentos existentes? */
SELECT
	DISTINCT op.payment_type 
FROM
	order_payments op 

/* Qual o maior número de parcelas realizado? */
SELECT
	MAX(op.payment_installments)
FROM
	order_payments op 
		
/* Qual o menor número de parcelas realizado? */
SELECT
	MIN(op.payment_installments)
FROM
	order_payments op 
	
/* Qual a média do valor pago no cartão de crédito? */
SELECT
	AVG(op.payment_value)
FROM
	order_payments op 
WHERE
	op.payment_type = 'credit_card' 

/* Quantos tipos de status para um pedido existem? */
SELECT
	COUNT(DISTINCT o.order_status)
FROM
	orders o 
	
/* Quais os tipos de status para um pedido? */ 
SELECT
	DISTINCT o.order_status
FROM
	orders o 

/* Quantos clientes distintos fizeram um pedido? */
SELECT COUNT(DISTINCT o.customer_id )
FROM orders o 
	
/* Quantos produtos estão cadastrados na empresa? */
SELECT COUNT(DISTINCT p.product_id)
FROM products p 

/* Qual a quantidade máxima de fotos de um produto? */
SELECT MAX(p.product_photos_qty)
FROM products p 

/* Qual o maior valor do peso entre todos os produtos? */
SELECT MAX(p.product_weight_g)
FROM products p 

/* Qual a altura média dos produtos? */
SELECT AVG(DISTINCT p.product_height_cm)
FROM products p 
 
 
 
 
 
 
 
 
 
 