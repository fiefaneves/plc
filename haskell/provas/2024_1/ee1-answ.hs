--Q1
type Chave = [(Char,Char)] 

letras :: [Char] 
letras = ['A'..'Z']

cria_chave :: Int -> Chave
cria_chave n = pula_posicao n letras letras

pula_posicao :: Int -> [Char] -> [Char] -> Chave
pula_posicao _ [] [] = []
pula_posicao n (x:xs) (y:ys) 
    | n > 0     = pula_posicao (n-1) (x:xs) (ys ++ [y])
    | otherwise = (x, y) : pula_posicao 0 xs ys

-- Q2
crypt :: Chave -> String -> String
crypt _ "" = ""
crypt chave (s:str) = cryptChar chave chave s : crypt chave str
    where
        cryptChar _ [] c = c
        cryptChar chave ((a,b):xs) c
            | c == ' '      = c
            | a == c        = b
            | otherwise     = cryptChar chave xs c

-- Q3
data ChaveTree = Node Char Char ChaveTree ChaveTree | Leaf deriving (Show)

chave_parcial :: ChaveTree
chave_parcial = Node 'I' 'L' (Node 'A' 'D' Leaf Leaf)  
                             (Node 'L' 'O' Leaf Leaf)

cryptT :: ChaveTree -> String -> String
cryptT _ "" = ""
cryptT chave (s:str) = cryptChar chave s : cryptT chave str
    where
        cryptChar Leaf c = c
        cryptChar (Node a b esq dir) c 
            | a == c    = b
            | c > a     = cryptChar dir c
            | otherwise = cryptChar esq c

-- Q4
ctree_to_chave :: ChaveTree -> Chave
ctree_to_chave Leaf = []
ctree_to_chave (Node a b esq dir) = ctree_to_chave esq ++ [(a,b)] ++ ctree_to_chave dir