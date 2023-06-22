-- seleciona os ids dos produtos nas categorias determinadas
-- e retorna esses ids para outra query calcular o preço
-- apenas dos produtos que possuem esses ids.
SELECT
  AVG(oi.price) as AVG_PRICE
FROM order_items AS oi
WHERE oi.product_id IN (SELECT p.product_ID
                     		FROM products AS p
                        WHERE p.product_category_name IN ('perfumaria', 'bebes'))

-- unindo as tabelas de pedidos com a de produtos
-- 1 pedido pode ter varios produtos associados, 1 pedido tem várias linhas.
SELECT
	oi.order_id, oi.order_item_id, oi.product_id AS oi_pid,
  p.product_id AS p_pid, oi.price, p.product_category_name
FROM order_items AS oi
LEFT JOIN products AS p ON oi.product_id = p.product_id
LIMIT 150

-- fazendo a mesma coisa que a primeira query faz,
-- sem utilizar subquery
SELECT
	AVG(oi.price) AS AVG_PRICE
FROM order_items AS oi
LEFT JOIN products AS p ON oi.product_id = p.product_id
WHERE p.product_category_name IN ('perfumaria', 'bebes')

-- eu quero a média de preço por categoria de produto
-- unir as tabelas, dar um groupby product_category_name e pegar avg(price)
SELECT
	p.product_category_name,
  AVG(oi.price)
FROM order_items AS oi
LEFT JOIN products AS p ON oi.product_id = p.product_id
GROUP BY p.product_category_name

-- eu quero a média de preço dos produtos que já foram entregues
SELECT
	AVG(oi.price)
FROM order_items AS oi
WHERE oi.order_id IN (SELECT o.order_id
                      FROM orders AS o
                      WHERE o.order_status = 'canceled')
  
  
SELECT DISTINCT orders.order_status
FROM orders

-- calcular a média de avaliações, preco médio, menor e maior preco
-- e clientes unicos por dia, que aconteceram no dia 02/10/2016
SELECT
	DATE(t.order_purchase_timestamp),
  AVG(t.review_score),
  COUNT(DISTINCT t.order_id) AS pedidos_unicos,
	AVG(t.price) AS avg,
  MIN(t.price) AS min,
  MAX(t.price) AS max,
  COUNT(DISTINCT t.customer_id) AS clientes_unicos
FROM (SELECT *
      FROM order_items AS oi 
        LEFT JOIN orders 				AS o 	ON oi.order_id = o.order_id
        LEFT JOIN order_reviews AS r	ON o.order_id = r.order_id) AS t
GROUP BY DATE(t.order_purchase_timestamp)
HAVING DATE(t.order_purchase_timestamp) = '2017-10-02'


SELECT
	DATE(review_creation_date),
  review_score,
  review_comment_title,
  review_comment_message
FROM order_reviews
WHERE DATE(review_creation_date) = '2016-10-02'
