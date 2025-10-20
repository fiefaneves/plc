data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)

faces :: Direction -> [Command] -> Direction
faces d [] = d
faces d (Forward n:xs) = faces d xs
faces d (Backward n:xs) = faces d xs
faces d (TurnLeft:xs)
       | d == North = faces West xs
       | d == South = faces East xs
       | d == West = faces South xs
       | d == East = faces North xs
faces d (TurnRight:xs)
       | d == North = faces East xs
       | d == South = faces West xs
       | d == West = faces North xs
       | d == East = faces South xs

main = do
       a <- getLine
       b <- getLine
       let result = faces (read a) (read b)
       print result  