-- recebe uma lista e retorna a soma dos numeros entre 0, .., 0 
-- ex: [0,1,2,3,0,1,2,0] => [6,3]
-- se tiver dois zeros em sequencia retorna a lista computada ate agora
-- ex [1,2,3,0,0] => [6]a

maquinaSomar :: [Int] -> [Int]
maquinaSomar [] = []
maquinaSomar (x:xs) = somaAux xs x

somaAux :: [Int] -> Int -> [Int]
somaAux [] s = []
somaAux (0:xs) 0 = []
somaAux (0:xs) s = s : somaAux xs 0
somaAux (x:xs) s = somaAux xs (s+x)