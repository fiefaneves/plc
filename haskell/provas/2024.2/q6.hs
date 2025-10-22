data Tree = No Int Tree Tree | Folha Int deriving Show

teste1 = No 50 (No 25 (No 12 (Folha 6) (Folha 13)) (No 30 (Folha 26) (Folha 32))) (Folha 59)
-- Resultado: True

teste2 = No 100 teste1 (No 200 (Folha 99) (No 298 (Folha 297) (Folha 299)))
-- Resultado: False

inOrder :: Tree -> [Int]
inOrder (Folha a) = a : []
inOrder (No a l r) = (inOrder l) ++ [a] ++ (inOrder r) 

isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (a:b:rest)
    | a <= b = isSorted (b:rest)
    | otherwise = False

ordenada :: Tree -> Bool
ordenada t = isSorted (inOrder t)
