import Data.List (sortBy)

-- EXEMPLO 1
-- QuickSort em Haskell
quickSort :: Ord a => [a] -> [a]

-- Caso Base:
quickSort [] = []
-- Caso Recursivo
-- 1. (x:xs) -> 'x' é o nosso Pivô. 'xs' é o resto da lista.
-- 2. Usamos list comprehensions para Particionar 'xs'.
-- 3. Chamamos quicksort recursivamente em cada partição.
-- 4. Concatenamos (++) os resultados com o pivô no meio.
quickSort (x:xs) = let menoresOuIguais = quickSort [a | a <- xs, a <= x]
                       maiores = quickSort [b | b <- xs, b > x]
                   in menoresOuIguais ++ [x] ++ maiores 


-- EXEMPLO 2
-- Função que, dado um número inteiro n
-- retorne uma lista de int com os n primeiros numeros pares da sequencia de fibonacci

-- A Sequência de Fibonacci é uma série de números onde cada número subsequente é a soma dos dois anteriores
-- começando geralmente com 0 e 1 (ou 1 e 1). A sequência inicia assim: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, e assim por diante. 

reverterLista :: [Int] -> [Int]
reverterLista [] = []
reverterLista (x:xs) = (reverterLista xs) ++ [x]

-- Função auxiliar recursiva.
-- n:   pares restantes a encontrar
-- a,b: últimos números de fibonacci
-- acc: lista de pares encontrados (em ordem inversa)
encontrarParesFib :: Int -> Int -> Int -> [Int] -> [Int]
-- Caso Base
encontrarParesFib 0 _ _ acc = acc
-- Caso Recursivo
encontrarParesFib n a b acc
    | (a + b) `mod` 2 == 0 = encontrarParesFib (n-1) b (a+b) ((a+b) : acc)
        -- O próximo número (a+b) é PAR.
        -- Adicionamos ele à lista (a+b):acc
        -- E agora precisamos encontrar n-1 pares.
    | otherwise = encontrarParesFib n b (a+b) acc
        -- O próximo número (a+b) é ÍMPAR.
        -- A lista de acumulados não muda.
        -- E ainda precisamos encontrar n pares.

-- Função principal
primeirosParesFib :: Int -> [Int]
-- Casos Base
primeirosParesFib n 
    | n <= 0 = []
    | n == 1 = [0]
-- Casos Recursivos, n > 1
    | otherwise = reverterLista (encontrarParesFib (n-1) 0 1 [0])

-- EXEMPLO 3
-- Função que recebe uma lista de inteiros e retorna a lista ordenada em função da soma de seus dígitos(crescente)

-- ordenar [5,12,70,8,25,3,150]
-- [12,3,5,150,70,25,8]

somaDigitos :: Int -> Int
somaDigitos 0 = 0
somaDigitos n = (n `mod` 10) + somaDigitos (n `div` 10)

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar (x:xs) = sortBy comparador (x:xs)
    where comparador a b = compare (somaDigitos a) (somaDigitos b)