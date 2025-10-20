--EX 1 - Vendas semanais
-- Semana -> Total de unidades vendidas
-- 1 -> 150
vendas :: Int -> Int
vendas n = mod n 17

-- Soma das semanas de 1 a n
totalVendas :: Int -> Int
totalVendas n | n <= 0    = 0 -- Caso base
              | n > 0     = vendas n + totalVendas (n - 1)
              | otherwise = 0 -- Caso de segurança

-- EX 2 - Número de semanas com vendas iguais a um valor dado 
-- Solução 1
-- Semana -> Total de unidades vendidas
vendasIguaisA :: Int -> Int -> Int

-- Casos Base: lidam com a última semana a ser verificada (sem = 0)
vendasIguaisA valor 0 | vendas 0 == valor = 1
                      | otherwise         = 0

-- Caso Recursivo: verifica a semana atual e chama a função para a próxima semana
vendasIguaisA valor sem | vendas sem == valor = 1 + vendasIguaisA valor (sem - 1)
                        | otherwise           = vendasIguaisA valor (sem - 1)

-- Solução 2 - usando função auxiliar com acumulador
vendasIguaisA' :: Int -> Int -> Int
vendasIguaisA' valor sem = vIa valor sem 0

vIa :: Int -> Int -> Int -> Int
-- valor sem res(acumulador)

-- Caso Base
vIa valor 0 res | vendas 0 == valor = res + 1 -- se for igual, incrementa o acumulador
                | otherwise         = res

-- Caso Recursivo
vIa valor sem res | vendas sem == valor = vIa valor (sem - 1) (res + 1) -- se for igual, incrementa o acumulador
                  | otherwise           = vIa valor (sem - 1) res -- se não for igual, não incrementa o acumulador

-- EX 3 - É Primo?
ehPrimo :: Int -> Bool
ehPrimo n | n <= 1    = False -- Números menores ou iguais a 1 não são primos
          | otherwise = testaPrimo (n-1) -- Verifica se tem divisores
    where
        testaPrimo 1 = True -- Caso base: se chegou a 1, é primo
        testaPrimo d | n `mod` d == 0 = False -- Se encontrar um divisor, não é primo
                     | otherwise    = testaPrimo (d-1) -- Continua testando com o próximo número menor

-- EX 4 - Primos entre si
primosEntreSi :: Int -> Int -> Bool
primosEntreSi a b = auxiliar (b - 1)
    where
        auxiliar 1 = True
        auxiliar d | a `mod` d == 0 && b `mod` d == 0 = False
                   | otherwise = auxiliar (d - 1)

main :: IO ()
main = do
    putStrLn "Testando a função ehPrimo:"
    let numeros = [-1, 0, 1, 2, 3, 4, 7, 9, 10, 13, 25, 97, 100]
    mapM_ (\num -> putStrLn (show num ++ " é primo? " ++ show (ehPrimo num))) numeros

-- EX 5 - Fatorial
fatorial :: Int -> Int
fatorial n | n < 0     = error "Fatorial não definido para números negativos"
           | n == 0    = 1
           | otherwise = n * fatorial (n - 1)

-- EX 6 - comparar se 4 números são iguais
allEqual :: Int -> Int -> Int -> Bool
allEqual x y z = (x == y) && (y == z)

-- Defina all4Equal usando allEqual
all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = allEqual a b c && allEqual b c d

-- Retorna quantos parâmetros são iguais
countEqual :: Int -> Int -> Int -> Int
countEqual x y z
    | allEqual x y z = 3
    | x == y || y == z || x == z = 2
    | otherwise = 0