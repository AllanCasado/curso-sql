/* 1. Gerar uma tabela de dados com 10 linhas, contendo o id
do pedido, o id do cliente, o status do pedido, o id do produto
e o preço do produto. */
SELECT
	o.order_id,
	o.customer_id,
	o.order_status,
	oi.product_id,
	oi.price 
FROM orders o 
INNER JOIN order_items oi 
ON (o.order_id = oi.order_id)
LIMIT 10;


/* Gerar uma tabela de dados com 20 linhas, contendo o id
do pedido, o estado do cliente, a cidade do cliente, o status
do pedido, o id do produto e o preço do produto, somente
para clientes do estado de São Paulo. */
SELECT
	o.order_id,
	c.customer_id,
	c.customer_state,
	c.customer_city,
	o.order_status,
	oi.product_id,
	p.product_category_name,
	oi.price
FROM orders o 
INNER JOIN customer c 
ON (o.customer_id = c.customer_id)
INNER JOIN order_items oi 
ON (o.order_id = oi.order_id)
INNER JOIN products p
ON (oi.product_id = p.product_id)
WHERE (c.customer_state = "SP")
	AND (o.order_id IN ("0008288aa423d2a3f00fcb17cd7d8719", "00946f674d880be1f188abc10ad7cf46"))

/* 3. Gerar uma tabela de dados com 50 linhas, contendo o id
do pedido, o estado e a cidade do cliente, o status do
pedido, o nome da categoria do produto e o preço do
produto, somente para pedidos com o status igual a
cancelado. */
SELECT
	o.order_id,
	c.customer_state, 
	c.customer_city,
	o.order_status,
	p.product_category_name,
	oi.price
FROM orders o INNER JOIN customer c     ON (o.customer_id = c.customer_id)
			  INNER JOIN order_items oi ON (oi.order_id = o.order_id)
			  INNER JOIN products p     ON (oi.product_id = p.product_id)
WHERE o.order_status = 'canceled' 
LIMIT 50;

/* 4. Gerar uma tabela de dados com 80 linhas, contendo o id
do pedido, o estado e a cidade do cliente, o status do pedido,
o nome da categoria do produto, o preço do produto, a
cidade e o estado do vendedor e a data de aprovação do
pedido, somente para os pedidos aprovadas a partir do dia
16 de Setembro de 2016. */
SELECT
	o.order_id,
	c.customer_state,
	c.customer_city,
	o.order_status,
	p.product_category_name,
	oi.price,
	s.seller_city,
	s.seller_state,
	o.order_approved_at 
FROM orders o INNER JOIN order_items oi ON (o.order_id = oi.order_id)
			  INNER JOIN customer c     ON (o.customer_id = c.customer_id)
			  INNER JOIN products p     ON (p.product_id = oi.product_id)
			  INNER JOIN sellers s      ON (oi.seller_id = s.seller_id)
WHERE o.order_approved_at >= '2016-09-16 00:00:00'
LIMIT 80;

/* 5. Gerar uma tabela de dados com 10 linhas, contendo o id
do pedido, o estado e a cidade do cliente, o status do pedido,
o nome da categoria do produto, o preço do produto, a cidade e 
o estado do vendedor, a data de aprovação do pedido e o tipo de 
pagamento, somente para o tipo de pagamento igual a boleto. */
SELECT 
	o.order_id,
	c.customer_state,
	c.customer_city,
	o.order_status,
	p.product_category_name,
	oi.order_item_id,
	oi.price,
	s.seller_state,
	s.seller_city,
	o.order_approved_at,
	op.payment_type
FROM orders o INNER JOIN customer c        ON (o.customer_id = c.customer_id)
			  INNER JOIN order_items oi    ON (o.order_id = oi.order_id)
			  INNER JOIN sellers s         ON (oi.seller_id = s.seller_id)
			  INNER JOIN order_payments op ON (oi.order_id = op.order_id)
			  INNER JOIN products p        ON (p.product_id = oi.product_id)
WHERE op.payment_type = 'boleto'
LIMIT 10;

/* 6. Gerar uma tabela de dados com 70 linhas, contendo o id
do pedido, o estado e a cidade do cliente, o status do pedido,
o nome da categoria do produto, o preço do produto, a
cidade e o estado do vendedor, a data de aprovação do
pedido, tipo de pagamento e a nota de avaliação do produto,
somente para os pedidos com a nota de avaliação do
produto igual a 1 */
SELECT
	o.order_id,
	c.customer_state,
	c.customer_city,
	o.order_status,
	p.product_category_name,
	oi.price,
	s.seller_city,
	s.seller_state,
	o.order_approved_at,
	op.payment_type,
	or2.review_score
FROM orders o INNER JOIN customer c        ON (o.customer_id = c.customer_id)
			  INNER JOIN order_items oi    ON (o.order_id = oi.order_id)
			  INNER JOIN products p        ON (oi.product_id = p.product_id)
			  INNER JOIN order_payments op ON (op.order_id = oi.order_id)
			  INNER JOIN order_reviews or2 ON (or2.order_id = o.order_id)
			  INNER JOIN sellers s         ON (s.seller_id = oi.seller_id)
WHERE or2.review_score = 1











