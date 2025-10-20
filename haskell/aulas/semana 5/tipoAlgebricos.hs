-- Definição dos tipos algébricos
data Expr = Lit Int 
          | Add Expr Expr   
          | Sub Expr Expr
          deriving (Show, Eq)

data List t = Nil | Cons t (List t)
            deriving (Show, Eq)

data Tree t = NilT | Node t (Tree t) (Tree t)
            deriving (Show, Eq, Ord)

-- Implementação das funções

-- Converte uma expressão para string
showExpr :: Expr -> String
showExpr (Lit n) = show n
showExpr (Add e1 e2) = "(" ++ showExpr e1 ++ " + " ++ showExpr e2 ++ ")"
showExpr (Sub e1 e2) = "(" ++ showExpr e1 ++ " - " ++ showExpr e2 ++ ")"

-- Converte List customizada para lista nativa do Haskell
toList :: List t -> [t]
toList Nil = []
toList (Cons x xs) = x : toList xs

-- Converte lista nativa do Haskell para List customizada
fromList :: [t] -> List t
fromList [] = Nil
fromList (x:xs) = Cons x (fromList xs)

-- Calcula a profundidade (altura) de uma árvore
depth :: Tree t -> Int
depth NilT = 0
depth (Node _ left right) = 1 + max (depth left) (depth right)

-- Converte uma árvore em lista (percurso in-order)
collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node x left right) = collapse left ++ [x] ++ collapse right

-- Aplica uma função a todos os elementos de uma árvore
mapTree :: (t -> u) -> Tree t -> Tree u
mapTree _ NilT = NilT
mapTree f (Node x left right) = Node (f x) (mapTree f left) (mapTree f right)

-- Exemplos de uso e testes
main :: IO ()
main = do
    -- Teste showExpr
    let expr = Add (Lit 3) (Sub (Lit 5) (Lit 2))
    putStrLn $ "Expressão: " ++ showExpr expr

    -- Teste toList e fromList
    let lista = fromList [1, 2, 3, 4]
    putStrLn $ "Lista customizada: " ++ show lista
    putStrLn $ "Convertida para lista nativa: " ++ show (toList lista)
    
    -- Teste árvore
    let arvore = Node 5 
                    (Node 3 (Node 1 NilT NilT) (Node 4 NilT NilT))
                    (Node 8 (Node 6 NilT NilT) (Node 9 NilT NilT))
    
    putStrLn $ "Árvore: " ++ show arvore
    putStrLn $ "Profundidade: " ++ show (depth arvore)
    putStrLn $ "Collapse (in-order): " ++ show (collapse arvore)
    putStrLn $ "MapTree (*2): " ++ show (mapTree (*2) arvore)