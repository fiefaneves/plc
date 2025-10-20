-- 1. Define a função insert que insere um elemento em uma lista ordenada, mantendo a ordenação.
insert :: Int -> [Int] -> [Int]
insert a [] = a:[]
insert a (x:xs)
    | x >= a = (a:x:xs)
    | otherwise = x : insert a xs 

-- 2. Escreva uma função que verifica se um número é primo. Um número primo é divisível apenas por 1 e por ele mesmo. O primeiro número primo é 2.
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
square x = x*x

sumPrimeSquares :: Int -> Int -> Int
sumPrimeSquares start end = foldr (+) 0 (map square (filter ehPrimo [start..end]))

-- 4. Use uma expressão lambda nas soluções da questão anterior
sumPrimeSquares1 :: Int -> Int -> Int
sumPrimeSquares1 start end = foldr (+) 0 (map (\x -> x*x) (filter ehPrimo [start..end]))

-- 5. Reescreva a função da questão 3 sem usar as funções map e filter, usando compreensão de listas onde for adequado.
sumPrimeSquares2 :: Int -> Int -> Int
-- sumPrimeSquares2 30 50 --> 8069
sumPrimeSquares2 start end = sum [x*x | x <- [start..end], ehPrimo x]