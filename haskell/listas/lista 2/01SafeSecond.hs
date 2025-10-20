import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)

safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond (x:xs) | length (x:xs) == 1 = Nothing
safeSecond (_:x:_) = Just x

main = do
       a <- getLine
       let result = safeSecond (read a::[Int])
       print result