fibonacci :: Int -> [Int]
fibonacci 0 = []
fibonacci 1 = [0]
fibonacci 2 = [0, 1]
-- fibonacci n = fibonacci (n-1) ++ [(last fibonacci (n-1)) + (last (init fibonacci (n-1)))]
fibonacci n = let fibs = fibonacci (n - 1)
              in fibs ++ [last fibs + last (init fibs)]