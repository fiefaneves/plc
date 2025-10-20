quicksort :: [Int] -> [Int]
quicksort [] = []  -- Caso base: a lista vazia já está ordenada.
quicksort (pivo:resto) = 
    -- 1. Separa em duas listas
    let menores = quicksort [x | x <- resto, x <= pivo]
        maiores = quicksort [x | x <- resto, x > pivo]
    -- 2. Combina os resultados
    in menores ++ [pivo] ++ maiores