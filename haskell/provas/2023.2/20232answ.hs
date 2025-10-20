-- Q1 fibonacci
fibonacci :: Int -> [Int]
fibonacci 0 = []
fibonacci 1 = [0]
fibonacci 2 = [0, 1]
fibonacci n = let fibs = fibonacci (n - 1)
              in fibs ++ [last fibs + last (init fibs)]

-- Q2
merge :: Ord t => [t] -> [t] -> [t]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

-- Q3 - mergesort
mergeSort :: Ord t => [t] -> [t]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort left) (mergeSort right)
  where
    (left, right) = splitHalf xs

splitHalf :: [t] -> ([t], [t])
splitHalf xs = splitAt (length xs `div` 2) xs

-- Q3 - pilha
type Pilha t = [t]
data Elemento = Valor Int | Soma | Multiplica deriving (Show)

exemploPilhaElem :: Pilha Elemento
exemploPilhaElem = [Valor 10, Valor 20, Soma, Valor 30, Multiplica]

geraString :: Pilha Elemento -> String
-- ex: geraString exemploPilhaElem >> ((10+20)*30)
geraString elementos = head (foldl processa [] elementos)
  where
    processa stack (Valor n) = (show n) : stack
    processa (e2:e1:rest) Soma = ("(" ++ e1 ++ "+" ++ e2 ++ ")") : rest
    processa (e2:e1:rest) Multiplica = ("(" ++ e1 ++ "*" ++ e2 ++ ")") : rest

-- Q4
calcula :: Pilha Elemento -> Int
-- read " -50 " :: Int
-- -50
calcula elementos = head (foldl process [] elementos)
  where
    process :: [Int] -> Elemento -> [Int]
    process stack (Valor n) = n : stack
    process (e2:e1:rest) Soma = (e1+e2) : rest
    process (e2:e1:rest) Multiplica = (e1*e2) : rest