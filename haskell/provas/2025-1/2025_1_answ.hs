import Data.Char (isDigit)
-- Q1
myZip :: [Int] -> [Int] -> [(Int, Int)]
myZip xs [] = []
myZip [] ys = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

-- Q2
toNumber :: Char -> Int
toNumber ch = fromEnum ch - fromEnum '0'

maior :: [Int] -> Int
maior [] = 0
maior list = maximum list

maiorDigito :: String -> Int
maiorDigito str = 
    let digitos = filter isDigit str
        numerosDigitos = map toNumber digitos
    in maior numerosDigitos

-- ou
-- maiorDigito :: String -> Int
-- maiorDigito str = foldr max 0 (map toNumber (filter isDigit str))

-- Q3
data Tree t = Node (Tree t) (Tree t) --No
            | Leaf t                 --folha

--a)
valores :: Tree t -> [t]
valores (Leaf a) = a : []
valores (Node esq dir) = (valores esq) ++ (valores dir)

arvore :: Tree Int
arvore = Node (Node (Leaf 10) (Node (Leaf 15) (Leaf 8)))
              (Node (Node (Leaf 2) (Node (Leaf 3) (Leaf 4))) (Leaf 0))

-- b)
combina :: (t -> t -> t) -> Tree t -> t
combina f (Leaf a) = a
combina f (Node esq dir) = f (combina f esq) (combina f dir)