import Data.List (nub)
-- nub -> remove duplicadas

agrupar :: (Eq t) => [[t]] -> [(t, Int)]
agrupar listas = [(x, count x todos) | x <- nub todos]
  where
    todos = concat listas  -- Junta todas as sublistas em uma única lista
    count y xs = length (filter (== y) xs)  -- Conta as ocorrências de 'y' em 'xs'