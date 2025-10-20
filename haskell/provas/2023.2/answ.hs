-- Q1
insert :: [t] -> [t] -> Int -> [t]
insert l1 l2 0 = l1 ++ l2
insert l1 [] _ = l1
insert l1 l2 s 
    | s < 0             = l1 ++ l2
    | s >= (length l2)   = l2 ++ l1
insert l1 (y:ys) s = y : insert l1 ys (s-1)

-- Q2
search :: Eq t => t -> [t] -> Int
search elem list = searchAux elem list 0

searchAux :: Eq t => t -> [t] -> Int -> Int
searchAux _ [] _ = -1
searchAux e (x:xs) c
    | e==x = c
    | otherwise = searchAux e xs (c+1)

-- Q3
data TimeOfDay = AM Int Int -- hora e minuto antes do meio dia
                | PM Int Int -- hora e minuto após o meio dia
                deriving (Show)

somaMinutos :: TimeOfDay -> Int -> TimeOfDay
somaMinutos (AM h m) minutosAdicionar
    | novoMinuto < 60 && novaHora <= 12  = AM novaHora novoMinuto
    | novoMinuto < 60 && novaHora > 12   = PM (novaHora - 12) novoMinuto
    | novoMinuto >= 60 && novaHora <= 12 = AM novaHora (novoMinuto `mod` 60)
    | novoMinuto >= 60 && novaHora > 12  = PM (novaHora - 12) (novoMinuto `mod` 60)
  where
    totalMinutos = m + minutosAdicionar
    horasAdicionais = totalMinutos `div` 60
    novoMinuto = totalMinutos `mod` 60
    novaHora = h + horasAdicionais

somaMinutos (PM h m) minutosAdicionar
    | novoMinuto < 60 && novaHora <= 12  = PM novaHora novoMinuto
    | novoMinuto < 60 && novaHora > 12   = AM (novaHora - 12) novoMinuto
    | novoMinuto >= 60 && novaHora <= 12 = PM novaHora (novoMinuto `mod` 60)
    | novoMinuto >= 60 && novaHora > 12  = AM (novaHora - 12) (novoMinuto `mod` 60)
  where
    totalMinutos = m + minutosAdicionar
    horasAdicionais = totalMinutos `div` 60
    novoMinuto = totalMinutos `mod` 60
    novaHora = h + horasAdicionais

-- Q4
data Resultado t = Success t | Fail
                    deriving Show

convertTime :: Int -> Int -> Resultado TimeOfDay
convertTime h m
    | h > 24 || m > 59  = Fail
    | h > 12            = Success (PM (h-12) m)
    | h < 12            = Success (AM h m)
    | h == 12           = Success (PM 12 m)