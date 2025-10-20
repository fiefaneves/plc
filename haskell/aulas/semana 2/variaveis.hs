-- DEFINIÇÃO DE VARIÁVEIS

-- answer :: Int
-- Haskell infere o tipo automaticamente
answer = 42

greater :: Bool
greater = (answer > 71)

yes :: Bool
yes = True

-- Variáveis não podem ser reatribuídas
-- answer = 43 -- Isso causaria um erro de compilação
-- Constantes são imutáveis

-- Devem começar com letra minúscula mas podem conter números e underscores
my_variable1 = "Hello, Haskell!"
-- :t my_variable1 --> Retorna o tipo da variável
-- my_variable1 :: String