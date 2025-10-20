-- soma elementos da lista
foldr (+) 0 [1, 2, 3, 4] -- Resultado: 10

-- multiplica elementos da lista
foldr (*) 1 [1, 2, 3, 4] -- Resultado: 24

-- encontrar max de uma lista
foldr max 0 [1, 5, 3, 2] -- Resultado: 5

-- encontrar min de uma lista
foldr min (maxBound :: Int) [1, 5, 3, 2] -- Resultado: 1

-- reverter uma lista
-- função lambda
foldr (\x acc -> acc ++ [x]) [] [1, 2, 3, 4] -- Resultado: [4, 3, 2, 1]

-- contar numero de elementos de uma linha
foldr (\_ acc -> acc + 1) 0 [1, 2, 3, 4] -- Resultado: 4

-- concatenar listas
foldr (++) [] [[1, 2], [3, 4], [5]] -- Resultado: [1, 2, 3, 4, 5]

-- Verificar se todos os elementos satisfazem uma condição (and)
foldr (&&) True [True, True, False] -- Resultado: False

-- Verificar se algum elemento satisfaz uma condição (or)
foldr (||) False [False, False, True] -- Resultado: True

-- calcular fatorial de um numero
foldr (*) 1 [1..5] -- Resultado: 120

-- converter uma lista de dígitos em um número
foldl (\acc x -> acc * 10 + x) 0 [1, 2, 3, 4] -- Resultado: 1234

-- filtrar elementos de uma lista
foldr (\x acc -> if x > 2 then x : acc else acc) [] [1, 2, 3, 4] -- Resultado: [3, 4]