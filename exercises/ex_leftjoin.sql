SELECT *
FROM order_items oi  
WHERE oi.order_id IN ('00143d0f86d6fbd9f9b38ab440ac16f5', '002f98c0f7efd42638ed6100ca699b42', '00571ded73b3c061925584feab0db425')

SELECT *
FROM orders o 
WHERE o.order_id IN ('00143d0f86d6fbd9f9b38ab440ac16f5', '002f98c0f7efd42638ed6100ca699b42', '00571ded73b3c061925584feab0db425')

SELECT o.order_id, oi.order_id, oi.order_item_id, oi.product_id 
FROM orders o LEFT JOIN order_items oi ON (o.order_id = oi.order_id)
WHERE o.order_id IN ('00143d0f86d6fbd9f9b38ab440ac16f5', '002f98c0f7efd42638ed6100ca699b42', '00571ded73b3c061925584feab0db425')

/* 1. Gerar uma tabela de dados com 20 linhas e contendo as seguintes
colunas: 1) Id do pedido, 2) status do pedido, 3) id do produto, 4)
categoria do produto, 5) avaliação do pedido, 6) valor do pagamento, 7)
tipo do pagamento, 8) cidade do vendedor, 9) latitude e longitude da
cidade do vendedor. */
SELECT
	o.order_id,
	o.order_status,
	p.product_id,
	p.product_category_name,
	or2.review_score,
	op.payment_value,
	op.payment_type,
	s.seller_city,
	g.geolocation_lat,
	g.geolocation_lng
FROM orders o LEFT JOIN order_items oi     ON (o.order_id = oi.order_id)
			  LEFT JOIN products p         ON (oi.product_id = p.product_id)
			  LEFT JOIN order_payments op  ON (o.order_id  = op.order_id)
			  LEFT JOIN order_reviews or2  ON (or2.order_id = o.order_id)
			  LEFT JOIN sellers s          ON (oi.seller_id = s.seller_id)
			  LEFT JOIN geolocation g      ON (s.seller_zip_code_prefix = g.geolocation_zip_code_prefix)
LIMIT 20;

/* 2. Quantos tipos de pagamentos foram usados pelo cliente para pagar
o pedido 'e481f51cbdc54678b7cc49136f2d6af7’ */
SELECT o.order_id,
	   op.payment_type
FROM orders o LEFT JOIN order_payments op ON (o.order_id = op.order_id)
WHERE o.order_id = 'e481f51cbdc54678b7cc49136f2d6af7'

/* 3. Quantos pedidos tem mais de 5 items distintos? */
SELECT
	o.order_id,
	COUNT(DISTINCT oi.product_id) AS items
FROM orders o LEFT JOIN order_items oi ON (o.order_id = oi.order_id)
GROUP BY o.order_id 
HAVING items > 5

/* 4. Qual a cardinalidade entre a tabela Pedidos ( orders ) e Avaliações (
reviews )? */
SELECT
	o.order_id, 
	COUNT(DISTINCT or2.review_id) AS num_reviews
FROM orders o LEFT JOIN order_reviews or2 ON (o.order_id = or2.order_id)
GROUP BY o.order_id
HAVING num_reviews > 1

/* A cardinalidade é de 1:N pois existe mais de uma avaliação por pedido */

/* 5. Quantos pedidos (orders) não tem nenhuma avaliação (review) ? */
SELECT
	o.order_id,
	COUNT(or2.review_id)
FROM orders o LEFT JOIN order_reviews or2 ON (o.order_id = or2.order_id)
GROUP BY o.order_id
HAVING COUNT(or2.review_id) = 0

/* 6. Quais são os top 10 vendedores com mais clientes? */
SELECT
	s.seller_id,
	COUNT(DISTINCT c.customer_id) AS clientes
FROM orders o LEFT JOIN order_items oi ON (o.order_id = oi.order_id)
			  LEFT JOIN sellers s	   ON (oi.seller_id = s.seller_id)
			  LEFT JOIN customer c     ON (c.customer_id = o.customer_id)
GROUP BY oi.seller_id 
ORDER BY clientes DESC
LIMIT 10;

/* 7. Quantos pedidos (orders) não possuem nenhum produto (products) ? */
SELECT
	COUNT(DISTINCT o.order_id)
FROM orders o LEFT JOIN order_items oi ON (o.order_id = oi.order_id)
WHERE oi.product_id IS NULL












