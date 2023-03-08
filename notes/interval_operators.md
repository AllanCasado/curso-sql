## O que são?

Os operadores de intervalo selecionam linhas da tabela dentro de um intervalo de valores que podem ser números, texto ou datas.

### BETWEEN

"Filtre por todas as linhas cujo valor esteja entre A e B"

SELECT ..
FROM ..
WHERE columnname BETWEEN 3 AND 10

* Da pra usar também "NOT BETWEEN".
* Ele inclui o 3 e o 10.


### IN

"Filtre todas as linhas cujo valor seja igual a X, Y ou Z"

SELECT ..
FROM ..
WHERE columnname IN ('X', 'Y', 'Z')

* Da pra usar também para selecionar números.
* "NOT IN" também funciona.


### LIKE

É utilizado para buscar um padrão no valor da coluna.

"Filtre todas as linhas caso você encontre um padrão no valor da coluna"

SELECT ..
FROM ..
WHERE columnname 'a%'

Isso significaria filtrar toda linha da tabela em que o valor da coluna columname comece com o caracter "a", independente dos outros caracteres da palavra.

WHERE columnname '%ria'

Pega todas as linhas em que 'ria' está no fim da palavra.

WHERE columnname LIKE 'a%s%o'

Tem que começar com a, ter um s no meio da palavra, em qualquer posição, e terminar com o.


### HAVING

Utilizado para filtrar linhas a partir do resultado de uma função agregadora.

SELECT 
   p.product-category-name,
   COUNT(p.product-id)
FROM products p
GROUP BY p.product-category-name
HAVING COUNT(p.product-id) > 2000

Faz o agrupamento por categoria e conta quantos produtos tem de cada categoria, mas filtra apenas por aquelas categorias que possuem mais de 2000 produtos.
	
