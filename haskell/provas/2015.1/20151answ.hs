-- Q1 -> APLICAÇÃO PARCIAL
-- f = map (+)
-- map :: (t -> u) -> [t] -> [u]
-- (+) :: Int -> Int -> Int

f :: Num a => [a] -> [a -> a]
f xs = map (+) xs

-- ex de uso:
-- let funcoesSoma = f [1,10,100] -- [(+1),(+10),(+100)]
-- let somaDez = funcoesSoma !! 1 -- pega a segunda função da lista (+10)
-- let resultado = somaDez 5 -- 15

-- g = (.) map map == map (map h)
-- (.) :: (b -> c) -> (a -> b) -> (a -> c) #COMPOSIÇÃO f(g(x))

-- map h // h :: a -> b
-- [a] -> [b]
-- map ([a] -> [b])
-- map ([a] -> [b]) -> [[a]] -> [[b]]

g :: (a -> b) -> [[a]] -> [[b]]
g h = map (map h)

-- ex de uso
-- let dobrar x = x*2
-- let dobrarEmLista = g dobrar
-- let listas = [[1,2,3], [4,5], [], [10]]

-- let resultado = dobrarEmLista listas -- [[2,4,6],[8,10],[],[20]]

-- Q2
type Resultado = [Int] 
type Jogos = [[Int]]

-- a)
premiados :: Resultado -> Jogos -> Int
premiados resultado jogos = length (filter (== resultado) jogos)

-- b)
acertos :: Resultado -> Jogos -> [Int]
acertos resultado [] = []
acertos resultado (x:xs) = numAcertos resultado x : acertos resultado xs
    where
        numAcertos :: Resultado -> [Int] -> Int
        numAcertos resultado jogo =  length (filter (`elem` resultado) jogo)

-- c)
numPremios :: Resultado -> Jogos -> (Int, Int, Int)
numPremios resultado jogos = (quatro, cinco, seis)
    where
        quatro = length (filter (==4) (acertos resultado jogos))
        cinco = length (filter (==5) (acertos resultado jogos))
        seis = length (filter (==6) (acertos resultado jogos))

-- Q3 - TIPOS ALGEBRICOS - STACK
data Instrucao  = PUSH Int -- empilha um valor inteiro 
                | POP      -- desempilha (remove) um valor do topo da pilha  
                | ADD      -- remove (lê) os dois valores no topo da pilha e deixa a soma deles no topo da pilha 
                | SUB      -- remove (lê) os dois valores no topo da pilha e deixa a soma deles no topo da pilha|  
                | DUP      -- repete o mesmo valor no topo da pilha (duplica ele) 
                deriving (Show, Eq)

type Pilha = [Int]

-- a)
evalI :: Instrucao -> Pilha -> Pilha 
-- exemplos: eval ADD [1,2,3,4,5] ---> [3,3,4,5] (soma 1+2) 
-- exemplos: eval DUP [5,1] ---> [5,5,1] (repete/copia o valor no topo da pilha) 
-- exemplos: eval SUB [1,2,3,4] ---> [-1,3,4] -- calcula 1-2=-1 
-- exemplos: eval ADD [1,2,3,4,5] ---> [3,3,4,5] (soma 1+2) 
-- exemplos: eval PUSH 7 [1,2,3] ---> [7,1,2,3] insere o 7 no topo 
-- exemplos: eval POP [8,2,3] ---> [2,3] -- remove 8

evalI ADD (a:b:rest) = a+b : rest
evalI DUP (a:rest) = a : a : rest
evalI SUB (a:b:rest) = a-b : rest
evalI (PUSH n) pilha = n : pilha
evalI POP (_:rest) = rest
evalI _ pilha = pilha -- caso de operação inválida

-- b)
evalProg :: [Instrucao] -> Pilha
-- exemplos: evalProg [PUSH 3, PUSH 5, DUP, ADD, SUB] ---> [7] (5+5-3)
evalProg instrucoes = foldl (flip evalI) [] instrucoes

-- Q4 
data Expr = Literal Int -- um número 
          | Soma Expr Expr -- soma as duas expressões 
          | Subtrai Expr Expr -- subtrai a segunda expressão da primeira 
          | Dobra Expr -- dobra o valor da expressão 
 
translate :: Expr -> [Instrucao] 
-- translate (Soma (Literal 5)  
--                 (Dobra (Subtrai (Literal 4) (Literal 1)))) 
-- ----> [PUSH 1, PUSH 4, SUB, DUP, ADD, PUSH 5, ADD]
translate (Literal n) = [PUSH n]
translate (Soma e1 e2) = translate e2 ++ translate e1 ++ [ADD]
translate (Subtrai e1 e2) = translate e2 ++ translate e1 ++ [SUB]
translate (Dobra e) = translate e ++ [DUP]

-- Q5
{-
Avaliação Estrita:
Em linguagens com avaliação estrita, os argumentos de uma função são avaliados imediatamente (antes da função ser chamada).
Isso significa que todas as expressões são avaliadas assim que são encontradas.

Avaliação Preguiçosa (Lazy):
Em linguagens com avaliação preguiçosa, os argumentos de uma função são avaliados somente quando necessários.
Isso permite que expressões sejam adiadas e até mesmo evitadas, caso o valor não seja usado
-}
-- Exemplo avaliação estrita
-- python
{-
def f(x, y):
    return x

# Chamando a função
f(1, 1/0)  # Isso gera um erro porque 1/0 é avaliado antes da função ser chamada.
-}

-- Exemplo avaliação preguiçosa (lazy):
f1 :: Int -> Int -> Int
f1 x y = x

-- Chamando a função
f1 1 (1 `div` 0)  -- Isso funciona porque `y` nunca é avaliado.
-- Resultado: 1

{-
Vantagens da Avaliação Preguiçosa:
    - Eficiência:
        Computações desnecessárias podem ser evitadas.
        Exemplo:
        take 5 [1..]  -- Retorna os primeiros 5 elementos de uma lista infinita.
        -- Resultado: [1, 2, 3, 4, 5]   
    - Trabalhar com estruturas infinitas:
        Avaliação preguiçosa permite manipular listas infinitas, pois os elementos são avaliados sob demanda.

Desvantagens da Avaliação Preguiçosa:
    - Uso de memória:
        Avaliação preguiçosa pode acumular "thunks" (expressões não avaliadas), o que pode levar a problemas de memória.
    - Dificuldade de depuração:
        O comportamento de avaliação preguiçosa pode ser mais difícil de entender e depurar.
-}