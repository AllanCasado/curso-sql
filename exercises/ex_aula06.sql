/* 1. Qual o número de clientes únicos nos estado de Minas Gerais ou Rio de
Janeiro? */
SELECT
	customer_state ,
	COUNT(c.customer_id)
FROM customer c 
WHERE c.customer_state = "MG"
   OR c.customer_state = "RJ"	
GROUP BY customer_state 

/* 2. Qual a quantidade de cidades únicas dos vendedores no estado de São
Paulo ou Rio de Janeiro com a latitude maior que -24.54 e longitude menor que
-45.63? */
SELECT 
	geolocation_state,
	COUNT(DISTINCT geolocation_city)
FROM geolocation g 
WHERE geolocation_state = "SP" OR geolocation_state = "RJ"
	AND (geolocation_lat > -24.54 AND geolocation_lng < -45.63)
 GROUP BY geolocation_state 

/* 3. Qual o número total de pedidos únicos, o número total de produtos e o
preço médio dos pedidos com o preço de frete maior que R$ 20 e a data limite
de envio entre os dias 1 e 31 de Outubro de 2016? */
SELECT 
	COUNT(DISTINCT oi.order_id),
	COUNT(oi.product_id),
	AVG(oi.price)
FROM order_items oi 
WHERE oi.freight_value > 20
	AND oi.shipping_limit_date >= '2016-10-01 00:00:00' 
	AND oi.shipping_limit_date <= '2016-10-31 00:00:00'
 

/* 4. Mostre a quantidade total dos pedidos e o valor total do pagamento, para
pagamentos entre 1 e 5 prestações ou um valor de pagamento acima de R$
5000. */
SELECT
	payment_type,
	payment_installments,
	COUNT(order_id),
	SUM(op.payment_value)
FROM order_payments op 
WHERE (op.payment_installments >= 1 AND op.payment_installments < 5)
	OR op.payment_value >= 5000
GROUP BY op.payment_type, payment_installments 

/* 5. Qual a quantidade de pedidos com o status em processamento ou
cancelada acontecem com a data estimada de entrega maior que 01 de Janeiro
de 2017 ou menor que 23 de Novembro de 2016? */

/* 6. Quantos produtos estão cadastrados nas categorias: perfumaria,
brinquedos, esporte lazer, cama mesa e banho e móveis de escritório que
possuem mais de 5 fotos, um peso maior que 5 g, um altura maior que 10 cm,
uma largura maior que 20 cm? */