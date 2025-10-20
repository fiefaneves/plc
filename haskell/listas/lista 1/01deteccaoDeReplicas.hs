isReplica :: String -> Int -> Char -> Bool
isReplica [] 0 _ = True
isReplica [] _ _ = False
isReplica _ 0 _ = False
isReplica (a:as) num c | a==c = isReplica as (num-1) c
                       | otherwise = False

main :: IO ()
main = do
    a <- getLine
    b <- getLine
    c <- getChar
    let result = isReplica a (read b) c
    print result