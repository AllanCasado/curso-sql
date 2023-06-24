WITH parcelas AS (
	SELECT
		op.order_id,
		SUM(op.payment_installments) AS qtd_parcelas
	FROM order_payments op 
	GROUP BY op.order_id 
)
SELECT
	pa.order_id,
	pa.qtd_parcelas
FROM parcelas AS pa


--multiplas table_views
WITH parcelas AS (
	SELECT
		op.order_id,
		SUM(op.payment_installments) AS qtd_parcelas
	FROM order_payments op 
	GROUP BY op.order_id 
), produtos AS (
	SELECT
		oi.order_id, 
		COUNT(oi.product_id) AS qtd_produtos
	FROM order_items oi 
	GROUP BY oi.order_id 
)
SELECT
	p.order_id,
	p.qtd_parcelas,
	po.qtd_produtos
FROM parcelas p INNER JOIN produtos po ON p.order_id = po.order_id






