mul2 :: [Int] -> [Int] -> [Int]
mul2 [] [] = []
mul2 [] (a:as) = map (*0) (a:as)
mul2 (a:as) [] = map (*0) (a:as)
mul2 (a:as) (b:bs) = (a*b) : mul2 as bs

main :: IO ()
main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result