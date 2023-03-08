## Operadores condicionais extras

### IS NULL/ IS NOT NULL

Seleciona linhas vazias/Seleciona linhas não vazias.

SELECT ..
FROM ..
WHERE columnname IS NOT NULL

Filtra todas as linhas nulas da coluna 'columnname'.


### LIMIT

Filtra a quantidade de linhas que deseja-se exibir.

SELECT ..
FROM ..
LIMIT 10

Exibe apenas 10 linhas.


### ORDER BY 

Ordena as linhas por determinada coluna de maneira ascendente ou descendente.

SELECT ..
FROM ..
ORDER BY colunname

SELECT ..
FROM ..
ORDER BY columnname DESC
