bSort :: [String] -> [String]
bSort [] = []
bSort (x:xs) = 
    let menores = [b | b <- xs, b <= x]
        maiores = [b | b <- xs, b > x]
    in bSort menores ++ [x] ++ bSort maiores

{-
ghci> "abc" > "cba" 
False
ghci> "abc" < "cba"
True
-}

main :: IO ()
main = do
       a <- getLine
       let result = bSort (read a :: [String])
       print result
