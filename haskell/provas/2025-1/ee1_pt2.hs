-- import Data.Char (isDigit)

--Q1

myZip :: [Int] -> [Int] -> [(Int, Int)]
myZip [] [] = []
myZip xs [] = []
myZip [] ys = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

--Q2
isDigit :: Char -> Bool
isDigit c
    | c `elem` ['1'..'9'] = True
    | otherwise = False

toNumber :: Char -> Int
toNumber ch = fromEnum ch - fromEnum '0'

filterDigit :: String -> [Int]
filterDigit "" = []
filterDigit (x:xs)
    | isDigit x = toNumber x : filterDigit xs
    | otherwise = filterDigit xs

maiorDigito :: String -> Int
maiorDigito str = foldr max 0 (filterDigit str)

--Q3
data Tree t = Node (Tree t) (Tree t) | Leaf t

--a)
valores :: Tree t -> [t]
valores (Leaf n) = n : []
valores (Node esq dir) = (valores esq) ++ (valores dir)

--b)
combina :: (t->t->t) -> Tree t -> t
combina f (Leaf n) = a
combina f (Node e d) = f (combina f e) (combina f d)