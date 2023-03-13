## Tipos de uniões

As uniões são feitas atrávés das chaves estrangeiras.

### INNER JOIN

O INNER JOIN retorna SOMENTE as linhas que estão TANTO na tabela da ESQUERDA quanto na tabela de DIREITA.

Geralmente a cardinalidade é 1:1

### LEFT JOIN

O LEFT JOIN retorna TODAS as linhas da tabela da ESQUERDA e SOMENTE as linhas correspondentes da tabela da DIREITA. Se nenhuma linha correspondente for encontrada na tabela da direita, o valor NULO é usado para indicar a falta de correspondência.

É a mesma coisa eu fazer o left join e tirar fora as linhas que tem nulo e eu fazer o inner join.

Geralmente a cardinalidade é 1:N

### RIGHT JOIN

O RIGHT JOIN retorna TODAS as linhas da tabela da DIREITA e SOMENTE as linhas correspondentes da tabela da ESQUERDA. Se nenhuma linha correspondente for encontrada na tabela da esquerda, o valor NULO é usado para indicar a falta de correspondência.

Geralmente a cardinalidade é N:1

### FULL OUTER JOIN

O FULL OUTER JOIN retorna TODAS as linhas da tabela da DIREITA e TODAS as linhas da tabela da ESQUERDA, mesmo se não houver correspondente. As linhas não correspondentes de cada tabela são preenchidas como valor NULO.

Geralmente a cardinalidade é N:M
