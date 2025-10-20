-- 1. Define a função insert que insere um elemento em uma lista ordenada, mantendo a ordenação.
insert :: Int -> [Int] -> [Int]
insert x [] = [x] -- Caso base: inserir em lista vazia resulta na lista com o elemento
insert x (value:values)
    | x <= value = x : value : values -- Inserir antes do primeiro elemento maior ou igual
    | otherwise = value : insert x values -- Recursivamente inserir no restante da lista

-- 2. Escreva uma função que verifica se um número é primo. Um número primo é divisível apenas por 1 e por ele mesmo. O primeiro número primo é 2.
-- ehPrimo :: Int -> Bool
-- ehPrimo 1 = False
-- ehPrimo 2 = True
-- ehPrimo n = testaPrimo 2
--     where
--         testaPrimo d value | value > (n `div` 2) = True
--                            | n `mod` d == 0 = False
--                            | otherwise = testaPrimo (d + 1) value
ehPrimo :: Int -> Bool
ehPrimo n 
    | n <= 1    = False 
    | otherwise = testaPrimo (n-1)
    where
        testaPrimo 1 = True 
        testaPrimo d
            | n `mod` d == 0 = False 
            | otherwise    = testaPrimo (d-1)

-- 3. Usando a função map, filter e alguma das funções fold, escreva uma função que retorna a soma dos quadrados dos números primos existentes
-- entre dois números (parâmetros da função).
-- Por exemplo, os números primos entre 30 e 50 são: 31, 37, 41, 43 e 47. Esses 5 números elevados ao quadrado são 961, 1369, 1681, 1849 e 2209. 
-- A soma desses números é 8069.
square :: Int -> Int
square x = x * x

sumPrimeSquares :: Int -> Int -> Int
sumPrimeSquares start end = foldr (+) 0 (map square (filter ehPrimo [start..end]))
-- Não pode usar o foldr1 porque pode ser que não haja números primos no intervalo, e aí daria erro.

-- 4. Use uma expressão lambda nas soluções da questão anterior
sumPrimeSquaresLambda :: Int -> Int -> Int
sumPrimeSquaresLambda start end = foldr1 (+) (map (\x -> x*x) (filter ehPrimo [start..end]))


-- 5. Reescreva a função da questão 3 sem usar as funções map e filter, usando compreensão de listas onde for adequado.
sumPrimeSquares2 :: Int -> Int -> Int
-- sumPrimeSquares2 30 50 --> 8069
sumPrimeSquares2 start end = sum [x*x | x <- [start..end], ehPrimo x]

-- 6. Arvore binaria.
-- Faça uma função que verifica se uma árvore esta ordenada, ou seja, todos os valores das sub arvores esquerdas de cada no sao sempre menores ou iguais que os nos acima
--  e os da subarvore direita sao sempre maiores ou iguais que os valores dos nos acima 

data Tree = No Int Tree Tree | Folha Int deriving (Show)

teste1 = No 50 (No 25 (No 12 (Folha 6) (Folha 13)) (No 30 (Folha 26) (Folha 32))) (Folha 59)
-- Resultado: True

teste2 = No 100 teste1 (No 200 (Folha 99) (No 298 (Folha 297) (Folha 299)))
-- Resultado: False

inOrder :: Tree -> [Int]
inOrder (Folha n) = [n]
inOrder (No n esq dir) = (inOrder esq) ++ [n] ++ (inOrder dir)

isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (a:b:rest)
    | a > b = False
    | otherwise = isSorted (b:rest)

ordenada :: Tree -> Bool
ordenada t = isSorted (inOrder t)