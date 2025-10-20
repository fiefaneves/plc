# Listas em Haskell

- **Definição**: 
    - Listas são coleções ordenadas de elementos do mesmo tipo.
    - Ordem dos elementos importa:
        - [1, 2, 3] == [2, 1, 3] -- False
    - Quantidade de elementos também importa:
        - [True, True] /= [True]

- **Sintaxe**: 
    - [1, 2, 3] :: Int
    - [(5, True), (7, True)] :: [(Int, Bool)] -- Listas de Tuplas
    - [[4,2], [3,7,7,1], [], [9]] :: [[Int]]
    - ['b', 'o', 'm'] :: [Char]
    - "bom" :: [Char] --> type String = [Char]
    - [] --> lista vazia de qualquer tipo -- Valor Polimorfico

- **Operações básicas**:
    - `:` (construtor polimórfico) adiciona elemento no início: `1 : [2,3]` resulta em `[1,2,3]`
        - (:) :: Int -> [Int] -> [Int]
        - (:) :: Bool -> [Bool] -> [Bool]
        - (:) :: t -> [t] -> [t]
        - Criar um lista:
        ```haskell
        2:3:4:5:[]
        -- Resultado: [2,3,4,5] 
        ```

    - Criar uma lista com todos os números entre 1 e 10:
        - [1..10]
    - Com caracteres:
        - ['a'..'z']
        - ['A'..'z'] -> tabela ASCII
    - Float:
        - [1.1..10.1]
    - **Podemos dizer o tamanho do incremento:**
        - [1.1, 1.2..10.1]

    - `++` concatena listas: `[1,2] ++ [3,4]` resulta em `[1,2,3,4]`
        - (++) :: [t] -> [t] -> [t]
    - `head` retorna o primeiro elemento: `head [1,2,3]` resulta em `1`
    - `tail` retorna todos menos o primeiro: `tail [1,2,3]` resulta em `[2,3]`
    - `null` verifica se está vazia: `null []` resulta em `True`
    - `length` retorna o tamanho: `length [1,2,3]` resulta em `3`
        - length :: [t] -> Int
        - length [] = 0
        - length (a:as) = 1 + length as
 
 ## Exemplos
 ```haskell
[2,4..9] -- [2,4,6,8]
[2..2] -- [2]
[2,7..4] -- [2]
[10,9..1] -- [10,9,8,7,6,5,4,3,2,1]
[10..1] -- []
[2,9,8..1] -- parse error on input `..'
 ```

## Funções sobre listas: (Estas funções são polimórficas)
- **Comprimento**
 ```haskell
lenght :: [t] -> Int
lenght [] = 0
lenght [a:as] = 1 + length as
 ```

- **Head:** Devolve o primeiro elemento da lista
 ```haskell
head :: [t] -> Int
head [1,2,3] -- 1
 ```

- **Tail:** Retorna os elementos da lista, exceto o primeiro(head)
 ```haskell
tail :: [t] -> [t]
tail [1,2,3] -- [2,3]
 ```

- **Concatenação: (++)**
```haskell
(++) :: [t] -> [t] -> [t]
[] ++ y = y
-- ou 
(++) [] y = y
(x:xs) ++ y = x : (xs ++ y)

-- Exemplos
ghci> (++) [1,2] [3]
[1,2,3]
ghci> [1,2] ++ [3]
[1,2,3]
```

### Exemplo: 
- Somas os elementos de uma lista (sumList :: [Int] -> Int)
```haskell
sumList as | as == [] = 0
           | otherwise = (head as) + sumList (tail as)
```

- **List Comprehension**: `[x*2 | x <- [1..5]]` resulta em `[2,4,6,8,10]`
- **Funções úteis**: `map`, `filter`, `foldr`, `foldl`
- **Imutabilidade**: Listas em Haskell são imutáveis.

# Casamento de Padrões
- Permite usar padrões no lugar de variáveis, na definição de funções:
```haskell
maxVendas :: Int -> Int
maxVendas 0 = vendas 0
maxVendas n = maxi (maxVendas (n-1))(vendas n)

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = totalVendas (n-1) + vendas n
```

## Exemplo
- devolve o maior elemento da lista
```haskell
maxEList :: [Int] -> Int
maxEList [] = minBound :: Int -- minBound = menor elemento de haskell
maxEList [x] = x -- ou maxEList (x:[]) = x -- Redundante, a recursão abaixo já resolve
maxEList (x:xs) | x > maxEList xs = x
                | otherwies = maxEList xs
```

## Regras de casamento de padrões:
- Todos os padrões (esquerda) devem ter o mesmo tipo
- Os casos devem ser exaustivos
    - Não é obrigatório --> Funções Parciais
- Não deve ter ambiguidade
    - ordem dos padrões usada para resolver conflitos

- Expressão `case` permite casamento de padrões com valores arbitrários (não apenas argumentos da função)
```haskell
firstDigit :: String -> Char
firstDigit st = case (digits st) of [] -> ´\0´
                                    (a:as) -> a
```