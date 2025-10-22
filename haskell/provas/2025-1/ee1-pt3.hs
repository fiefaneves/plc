--q1
myZip :: [Int] -> [Int] -> [(Int,Int)]
myZip [] [] = []
myZip [] ys = []
myZip xs [] = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

--q2
toNumber :: Char -> Int
toNumber ch = fromEnum ch - fromEnum '0'

maiorDigito :: String -> Int
maiorDigito str = maximum (digits str)
    where
        digits "" = 0 : []
        digits (c:rest)
            | c `elem` ['1'..'9'] = (toNumber c) : digits rest
            | otherwise = digits rest

--q3
data Tree t = Node (Tree t) (Tree t) | Leaf t
--a)
valores :: Tree t -> [t]
valores (Leaf a) = a : []
valores (Node esq dir) = (valores esq) ++ (valores dir)

arvore :: Tree Int
arvore = Node (Node (Leaf 10) (Node (Leaf 15) (Leaf 8)))
              (Node (Node (Leaf 2) (Node (Leaf 3) (Leaf 4))) (Leaf 0))
--b)
combina :: (t->t->t) -> Tree t -> t
combina f (Leaf a) = a
combina f (Node l r) = f (combina l) (combina r)