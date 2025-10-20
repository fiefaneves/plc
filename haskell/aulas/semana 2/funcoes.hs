-- DEFINIÇÃO DE FUNÇÕES
-- Consegue inferir o tipo sozinho
-- Começar com letra minúscula

-- O que vem antes da última -> são os tipos dos parâmetros e depois vem o tipo do retorno
square :: Int -> Int
square x = x * x

allEqual :: Int -> Int -> Int -> Bool
allEqual x y z = (x == y) && (y == z)

maxi :: Int -> Int -> Int
-- | --> Clausula de guarda (guard clause)
maxi m n | m >= n    = m
         | otherwise = n

-- maxi a b = if a >= b then a else b

-- APLICAÇÃO DE FUNÇÕES
-- square 5
-- square (5)

-- allEqual 3 3 3 -- True
-- allEqual 3 (1+2) (6 `div` 2) -- True
-- allEqual 3 4 3 -- False
-- allEqual (3) (3) (1) -- False

-- maxi 3 5 -- 5
-- maxi (3+2) (2*3) -- 6