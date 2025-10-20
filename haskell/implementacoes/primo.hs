ehPrimo :: Int -> Bool
ehPrimo n 
    | n <= 1    = False 
    | otherwise = testaPrimo (n-1)
    where
        testaPrimo 1 = True 
        testaPrimo d
            | n `mod` d == 0 = False 
            | otherwise    = testaPrimo (d-1)