-- A função 'merge' combina duas listas ordenadas em uma única lista ordenada.
merge :: Ord t => [t] -> [t] -> [t]
merge [] ys = ys           -- Se a primeira lista está vazia, retorna a segunda.
merge xs [] = xs           -- Se a segunda lista está vazia, retorna a primeira.
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys) -- Se x <= y, coloca x na frente e continua mesclando.
  | otherwise = y : merge (x:xs) ys -- Caso contrário, coloca y na frente e continua mesclando.

-- 'mergeSort' é a função principal que ordena uma lista usando o algoritmo Merge Sort.
mergeSort :: Ord t => [t] -> [t]
mergeSort [] = []       -- Caso base: lista vazia já está ordenada.
mergeSort [x] = [x]     -- Caso base: lista com um elemento já está ordenada.
mergeSort xs = merge (mergeSort left) (mergeSort right) -- Divide e conquista: ordena as metades e mescla.
  where
    (left, right) = splitHalf xs -- Divide a lista em duas partes aproximadamente iguais.

splitHalf :: [t] -> ([t], [t])
splitHalf xs = splitAt (length xs `div` 2) xs