-- ROW_NUMBER()
-- quero criar um ranking dos produtos de cada
-- categoria de acordo com o preço.
-- o problema de usar o row_number() é que produtos com preços iguais
-- foram aleatoriamente sorteados em determinada ordem.
SELECT
	DISTINCT oi.product_id,
	p.product_category_name,
	oi.price,
	ROW_NUMBER() OVER (PARTITION BY p.product_category_name
					   ORDER BY oi.price DESC) AS rank_price
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
WHERE p.product_category_name IS NOT NULL


--RANK()
-- quando tem preços iguais repete o rank mas não
-- segue de onde parou.
SELECT
	oi.product_id,
	p.product_category_name,
	oi.price,
	RANK() OVER (PARTITION BY p.product_category_name 
				 ORDER BY oi.price DESC) AS rank_price
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
WHERE p.product_category_name IS NOT NULL

--DENSE_RANK()
-- quando tem preço igual repete o rank mas nas proximas
-- linhas segue de onde parou.
SELECT
	oi.product_id,
	p.product_category_name,
	oi.price,
	DENSE_RANK() OVER (PARTITION BY p.product_category_name 
				 ORDER BY oi.price DESC) AS rank_price
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
WHERE p.product_category_name IS NOT NULL


--PERCENT_RANK()
-- da em porcentagem.
SELECT
	oi.product_id,
	p.product_category_name,
	oi.price,
	PERCENT_RANK() OVER (PARTITION BY p.product_category_name 
				 ORDER BY oi.price) AS rank_price
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
WHERE p.product_category_name IS NOT NULL


--NTILE() 
-- divide em buckets. passar no parenteses quantos
-- buckets quer.
SELECT
	oi.product_id,
	p.product_category_name,
	oi.price,
	NTILE(4) OVER (PARTITION BY p.product_category_name 
				 ORDER BY oi.price) AS rank_price
FROM order_items oi LEFT JOIN products p ON oi.product_id = p.product_id 
WHERE p.product_category_name IS NOT NULL






