SELECT
	o.order_id AS id,
	o.order_status AS status_pedido,
	CASE 
		WHEN o.order_status = 'delivered' THEN 'entregue'
		WHEN o.order_status != 'delivered' THEN 'nao_entregue'
	END AS status,
	oi.total_price AS price_pedido,
	CASE 
		WHEN oi.total_price > 100 THEN 'pedido_caro'
		WHEN oi.total_price <= 100 THEN 'pedido_barato'
	END AS categoria_pedido,
	DATE(o.order_approved_at) AS data
FROM orders o RIGHT JOIN (SELECT 
							oi.order_id,
							SUM(oi.price) AS total_price
						  FROM order_items oi
						  GROUP BY oi.order_id) AS oi ON o.order_id = oi.order_id


-- exercicios
					  
--4.1 Crie uma consulta que exiba o código do produto e a categoria de cada produto
--com base no seu preço:
--Preço abaixo de 50 → Categoria A
--Preço entre 50 e 100 → Categoria B
--Preço entre 100 e 500 → Categoria C
--Preço entre 500 e 1500 → Categoria D
--Preço acima de 1500 → Categoria E		
SELECT
	DISTINCT p.product_id,
	p.product_category_name,
	oi.price,
	CASE 
		WHEN oi.price < 50                  THEN 'A'
		WHEN oi.price BETWEEN 50  AND 100   THEN 'B'
		WHEN oi.price BETWEEN 100 AND 500   THEN 'C'
		WHEN oi.price BETWEEN 500 AND 1500  THEN 'D'
		ELSE 'E'
	END AS categoria
FROM products p LEFT JOIN order_items oi ON p.product_id = oi.product_id 

--4.2 Calcule a quantidade de produtos para cada uma das categorias criadas no
--exercícios anterior.
SELECT
	t.categoria,
	COUNT(t.product_id)
FROM(SELECT
		DISTINCT p.product_id,
		p.product_category_name,
		oi.price,
		CASE 
			WHEN oi.price < 50                  THEN 'A'
			WHEN oi.price BETWEEN 50  AND 100   THEN 'B'
			WHEN oi.price BETWEEN 100 AND 500   THEN 'C'
			WHEN oi.price BETWEEN 500 AND 1500  THEN 'D'
			ELSE 'E'
		END AS categoria
	FROM products p LEFT JOIN order_items oi ON p.product_id = oi.product_id) AS t
GROUP BY t.categoria
						  
--4.3 Selecione os seguintes categorias de produtos: livros técnicos, pet shop, pc gamer,
--tablets impressão imagem, fashion esports, perfumaria, telefonia, beleza saude,
--ferramentas jardim.
--
--Crie uma primeira coluna mostrando o novo preço da categoria, segundo os valores
--abaixo:
--
--Livros técnicos - 10% de desconto
--Pet shop - 20% de desconto
--PC gamer - 50% de aumento
--Tablets - 10% de aumento
--Fashion Esports - 5% de aumento
--
--Crie uma segunda coluna mostrando se a categoria sofreu ou não alteração de preço
SELECT
	t.id,
	t.categoria,
	t.preco,
	t.preco_alterado,
	CASE 
		WHEN preco != preco_alterado THEN 'sofreu_alteracao'
		ELSE 'nao_sofreu'
	END AS sofreu_alteracao
FROM(SELECT
		DISTINCT p.product_id AS id,
		p.product_category_name AS categoria,
		oi.price AS preco,
		CASE 
			WHEN p.product_category_name = 'livros_tecnicos'  THEN (oi.price * 0.9)
			WHEN p.product_category_name = 'pet_shop'         THEN (oi.price * 0.8)
			WHEN p.product_category_name = 'pc_gamer'         THEN (oi.price * 1.5)
			WHEN p.product_category_name = 'tablets'          THEN (oi.price * 1.1)
			WHEN p.product_category_name = 'fashion_esporte'  THEN (oi.price * 1.05)
			ELSE oi.price
		END AS preco_alterado
	FROM products p LEFT JOIN order_items oi ON p.product_id = oi.product_id 
	WHERE p.product_category_name IN ('livros_tecnicos', 'pet_shop', 'pc_gamer','tablets', 
									   'impressão_imagem', 'fashion_esportes', 'perfumaria', 'telefonia', 
									   'beleza_saude', 'ferramentas_jardim')) AS t


--4.4 Crie uma coluna que mostra o status de entrega do pedido. Se a coluna estiver
--vazia, o status é de pendente.
--“order_delivered_customer_date” - pendente
--“order_delivered_customer_date” menor que o dia 01 de Junho de 2017 - entregue
--“order_delivered_customer_date” maior que o dia 01 de Junho de 2017 -programado
SELECT 
	o.order_id AS id,
	DATE(o.order_delivered_customer_date) as data_entrega,
	CASE 
		WHEN DATE(o.order_delivered_customer_date) IS NULL THEN 'pendente'
		WHEN DATE(o.order_delivered_customer_date) < '2017-06-01' THEN 'entregue'
		ELSE 'programado'
	END AS status
FROM orders o
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
--