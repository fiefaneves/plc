## Funções de Alta Ordem em Haskell
Funções de alta ordem são funções que recebem outras funções como argumentos ou retornam funções como resultado. Em Haskell, três exemplos clássicos são:

### Mapeamento (`map`)
Aplica uma função a cada elemento de uma lista, produzindo uma nova lista com os resultados.
```haskell
:type map 
map :: (a -> b) -> [a] -> [b]
```
```haskell
map (*2) [1,2,3] -- Resultado: [2,4,6]
map ord [a..z]
```

### Redução (`foldr`, `foldl`)
Combina os elementos de uma lista usando uma função e um valor inicial, reduzindo a lista a um único valor.
```haskell
-- Soma os elementos da lista
foldr (+) 0 [1,2,3,4] -- Resultado: 10
```

### Filtragem (`filter`)
Seleciona apenas os elementos de uma lista que satisfazem um predicado (função que retorna `True` ou `False`).
```haskell
filter :: (a -> Bool) -> [a] -> [a]
```
```haskell
filter even [1,2,3,4] -- Resultado: [2,4]
filter (>5) [1..10] -- Resultado: [6,7,8,9,10]
```

Essas funções permitem manipular listas de forma concisa e expressiva.

### Funções como valores: composição e lambdas

Em Haskell, funções são tratadas como valores, podendo ser passadas como argumentos, retornadas por outras funções e armazenadas em variáveis.

### **Composição de funções (`.`):** Permite combinar funções, criando novas funções a partir de outras. Por exemplo, `(f . g) x` é o mesmo que `f (g x)`.
```haskell
:type (.)
(.) :: (b -> c) -> (a -> b) -> a -> c
```
```haskell
(negate . abs) (-5) -- Resultado: -5
((map (+1)) . (map (+2))) [1..4] -- Resultado: [4,5,6,7]
```
```haskell
(\f -> \g -> \x -> f(g x)) f g
(\f -> \g -> \x -> f(g x)) (\a -> a + 1) (\b -> b + 2)
(\g -> \x -> (\a -> a + 1)(g x)) (\b -> b + 2)
(\x -> (\a -> a + 1) ((\b -> b + 2) x))
```



### **Funções lambda:** São funções anônimas, definidas de forma concisa usando a sintaxe `\`. Úteis para criar funções rápidas e simples sem nomeá-las.
```haskell
maisTres x = x + 3
maisTres =  λx . x + 3
maisTres =  \x -> x + 3
maisTres 9 -> 12
maisTres 9
-> (\x -> 3) 9
-> 9 + 3
-> 12 
```
```haskell
map (\x -> x * 3) [1,2,3] -- Resultado: [3,6,9]
```

#### Por que usar lambda em Haskell?

Funções lambda são úteis quando você precisa de uma função simples e rápida, especialmente em situações onde não faz sentido criar uma função nomeada. Elas tornam o código mais conciso e legível, facilitando a passagem de funções como argumentos para funções de alta ordem, como `map`, `filter` e `foldr`. Além disso, permitem criar funções personalizadas diretamente no local onde são necessárias, sem poluir o escopo com nomes desnecessários.

Exemplo:
```haskell
map (\x -> x * 2) [1,2,3] -- Resultado: [2,4,6]
```

Esses recursos tornam o código mais flexível e expressivo.