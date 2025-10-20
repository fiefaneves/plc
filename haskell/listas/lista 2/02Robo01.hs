data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

move :: (Int,Int) -> [Command] -> Int -> (Int,Int)
move pos [] _ = pos
move (a,b) (Forward c:rest) 0 = move (a,b+c) rest 0
move (a,b) (Backward c:rest) 0 = move (a,b-c) rest 0
move (a,b) (TurnLeft:rest) 0 = move (a,b) rest 270
move (a,b) (TurnRight:rest) 0 = move (a,b) rest 90

move (a,b) (Forward c:rest) 90 = move (a+c,b) rest 90
move (a,b) (Backward c:rest) 90 = move (a-c,b) rest 90
move (a,b) (TurnLeft:rest) 90 = move (a,b) rest 0
move (a,b) (TurnRight:rest) 90 = move (a,b) rest 180

move (a,b) (Forward c:rest) 180 = move (a,b-c) rest 180
move (a,b) (Backward c:rest) 180 = move (a,b+c) rest 180
move (a,b) (TurnLeft:rest) 180 = move (a,b) rest 90
move (a,b) (TurnRight:rest) 180 = move (a,b) rest 270

move (a,b) (Forward c:rest) 270 = move (a-c,b) rest 270
move (a,b) (Backward c:rest) 270 = move (a+c,b) rest 270
move (a,b) (TurnLeft:rest) 270 = move (a,b) rest 180
move (a,b) (TurnRight:rest) 270 = move (a,b) rest 0

destination :: (Int,Int) -> [Command] -> (Int,Int)
destination (a,b) commands = move (a,b) commands 0

{-
Norte (0°)
Leste (90°)
Sul (180°)
Oeste (270°)
-}

{-
(-2, 2) (-1, 2) (0, 2) (1, 2) (2, 2)
(-2, 1) (-1, 1) (0, 1) (1, 1) (2, 1)
(-2, 0) (-1, 0) (0, 0) (1, 0) (2, 0)
(-2,-1) (-1,-1) (0,-1) (1,-1) (2,-1)
(-2,-2) (-1,-2) (0,-2) (1,-2) (2,-2)
-}

main = do
       a <- getLine
       b <- getLine
       let result = destination (read a) (read b)
       print result