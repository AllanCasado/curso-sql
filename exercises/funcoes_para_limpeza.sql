--COALESCE()
--A função COALESCE retorna o primeiro elemento não vazio. Na prática, essa função é
--usada para substituir dados faltantes.
SELECT
	o.order_id,
	o.order_status,
	o.customer_id,
	COALESCE(or2.review_comment_title, "sem_titulo") AS titulo,
	COALESCE(or2.review_comment_message, "sem_mensagem") AS mensagem,
	o.order_status || "- " || COALESCE(or2.review_comment_title, "sem_titulo") AS status_final
FROM orders o LEFT JOIN order_reviews or2 ON o.order_id = or2.order_id 


-- LOWER() e UPPER()
-- Coloca em letra minuscula ou maiuscula.
SELECT
	o.order_id,
	o.order_status,
	o.customer_id,
	LOWER(COALESCE(or2.review_comment_title, "sem_titulo"))AS titulo,
	UPPER(COALESCE(or2.review_comment_message, "sem_mensagem")) AS mensagem
FROM orders o LEFT JOIN order_reviews or2 ON o.order_id = or2.order_id 


-- SUBSTRING()
--A função SUBSTRING extra um parte do texto. Você precisa indicar o texto, o inicio do
--recorte e o número de caracteres que você quer recortar.
SELECT
	o.order_id,
	o.order_status,
	o.customer_id,
	or2.review_comment_title AS titulo,
	SUBSTRING(or2.review_comment_title, 0, 3) AS caracteres --pega os 3 primeiros caracteres do titulo
FROM orders o LEFT JOIN order_reviews or2 ON o.order_id = or2.order_id 


--REPLACE()
--A função REPLACE substitui uma string ( texto ) por uma nova string (texto). Nessa
--função, você precisa passar o texto, a palavra antiga e a palavra nova que substituirá a
--antiga
SELECT
	o.order_id,
	o.order_status,
	o.customer_id,
	or2.review_comment_title AS titulo,
	REPLACE(LOWER(or2.review_comment_title), "muito", "muito muito muito")
FROM orders o LEFT JOIN order_reviews or2 ON o.order_id = or2.order_id


--ROUND()
--Arredondamento dos números.
SELECT
	oi.price,
	ROUND(oi.price, 0) AS inteiro,
	ROUND(oi.price, 1) AS uma_casa_decimal
FROM order_items oi 







