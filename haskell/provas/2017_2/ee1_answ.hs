-- --Q1
-- locate :: Eq t => t -> [t] -> Int
-- locate n l = locateAux n 0 l

-- locateAux :: Eq t => t -> t -> [t] -> Int
-- locateAux _ _ [] = -1
-- locateAux v p (x:xs)
--     | v == x    = p
--     | otherwise = locateAux v (p+1) xs

--Q2
substr :: String -> String -> Bool
substr _ "" = False
substr "" _ = True
substr s1 s2 = isSubstr s1 s2 || substr s1 (tail s2)

isSubstr :: String -> String -> Bool
isSubstr "" _ = True
isSubstr _ "" = False
isSubstr (x:xs) (y:ys)
    | x == y = isSubstr xs ys
    | otherwise = False