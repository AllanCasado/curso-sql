## Novas colunas utilizando CASE WHEN

Criar colunas com base em determinada condição.

SELECT
	oi.price,
	CASE WHEN oi.price < 20 THEN 'super_barato'
	     WHEN oi.price < 100 THEN 'barato'
	     WHEN oi.price > 150 AND oi.price < 180 THEN 'normal'
	ELSE 'caro' END AS status
FROM order_items oi


## Operações em colunas

### Verificando o tipo das colunas para garantir que as operações matemáticas ocorram bem

Verificar o tipo das colunas:
* PRAGMA table_info(table_name)
* SELECT typeof(tb.coluna)
  FROM tb

Mudar o tipo das colunas:
* CAST( <coluna> AS <novo_tipo>)


### Operação com Case When

Quando tem case when, basta passar a função agregadora antes do CASE e fechar o parentesis depois do END.

Lembrando que não vai criar a coluna de fato, vai apenas dar a metrica que você está calculando.
