# O que são Subqueries?

As subqueries são consultas dentro de outra consulta. Ou seja, são consultas que pré-processam alguma tabela antes de anexa-lá a tabela principal.

É uma pré consulta que prepara os dados para que sejam anexados em outra tabela.

### Exemplo

SELECT
    oi.product_id,
    AVG(oi.price) AS avg_price
FROM order_items oi
WHERE oi.product_id IN (SELECT p.product_id
			FROM products p
			WHERE p.product_category_name IN ('perfumaria', 'artes'))

Está pegando os ids que são da categoria de perfumaria e artes e usando esses ID's como filtro pra outra consulta.



