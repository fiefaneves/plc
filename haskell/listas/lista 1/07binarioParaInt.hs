-- converter binario para decimal
btoi :: String -> Int
btoi [] = 0
btoi (x:xs) = digitToInt x * (2 ^ (length xs)) + btoi xs
    where 
        digitToInt '0' = 0
        digitToInt '1' = 1
        
main :: IO ()
main = do
    s <- getLine
    let result = btoi s
    print result