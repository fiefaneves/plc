-- A
isReplica :: String -> Int -> Char -> Bool
isReplica [] 0 _ = True
isReplica (x:xs) n a 
    | x==a      = isReplica xs (n-1) a
    | otherwise = False

-- B
mul2 :: [Int] -> [Int] -> [Int]
mul2 [] [] = [] 
mul2 (x:xs) [] = x*0 : mul2 xs []
mul2 [] (y:ys) = y*0 : mul2 [] ys
mul2 (x:xs) (y:ys) = x*y : mul2 xs ys 

-- C

-- D

-- E
sumTo :: Int -> Int
sumTo 0 = 0
sumTo n = n + sumTo (n-1)

-- F
bSort :: [String] -> [String]
bSort [] = []
bSort (a:b:rest)
    | a <= b

-- G
btoi :: String -> Int
btoi [] = 0
btoi (x:xs) = digitToInt x * (2^(length xs)) + btoi xs
    where 
        digitToInt '0' = 0
        digitToInt '1' = 1
        