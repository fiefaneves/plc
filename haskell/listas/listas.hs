dobrar :: [Int]->[Int]
dobrar [] = []
dobrar (a:as) = a * 2 : dobrar as

membro :: [Int]->Int->Bool
membro [] _ = False
membro (a:as) x
  | a == x = True
  | otherwise = membro as x

allEqual :: (Eq t)=>t->t->t->Bool
allEqual a b c = (a == b) && (b == c)


type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

banco = [("Fernando", "Storm Front"), ("Andre", "The Martian Chronicles"),("Fernando", "Superfreakonomics")]

livros :: BancoDados -> Pessoa -> [Livro]
livros [] _ = []
livros ((p,l):as) x 
  | x == p = l:livros as x
  | otherwise = livros as x
 
qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos b p = length (livros b p)

emprestar :: BancoDados->Livro->Pessoa->BancoDados
emprestar b l p = (p,l):b

devolver :: BancoDados->Livro->Pessoa->BancoDados
devolver [] _ _ = []
devolver ((pp,ll):as) l p
  | p == pp && l == ll = as
  | otherwise = (pp,ll):devolver as l p

livros2 :: BancoDados->Pessoa->[Livro]
livros2 bd p = [x | (y,x)<-bd, p == y] 

qs [] = []
qs (a:as) = (qs [x| x<-as, x <= a]) ++ [a] ++ (qs [y| y<-as, y>a])

getWord :: String -> String
getWord [] = []
getWord (a:as) 
  | a == ' ' = []
  | otherwise = a : getWord as

dropSpace :: String->String
dropSpace [] = []
dropSpace (a:as) 
  | a == ' ' = dropSpace as
  | otherwise = (a:as)

dropWord :: String->String
dropWord [] = []
dropWord (a:as) 
  | a /= ' ' = dropWord as
  | otherwise = as

splitWords :: String -> [String]
splitWords [] = []
splitWords l = (getWord l):splitWords (dropWord (dropSpace l))

getLine2 :: Int-> [String]->[String]
getLine2 _ [] = []
getLine2 i (a:as)
  | i > (length a) = a : getLine2 (i - (length a)) as
  | otherwise = []

dropLine2 :: Int->[String]->[String]
dropLine2 _ [] = []
dropLine2 i (a:as)
  | i >= (length a) = dropLine2 (i - (length a)) as
  | otherwise = (a:as)

isCrescent :: (Int->Int)->Int->Bool
isCrescent f 0 = False
isCrescent f 1 = f 1 > f 0
isCrescent f n = (f n > f (n-1)) && isCrescent f (n-1)

iter 0 f = id
iter n f = (iter (n-1) f).f

addNum :: Int -> (Int -> Int)
addNum n = h
  where 
  h m = n + m

data Lista t = Nil | Cons t (Lista t) 
  deriving (Eq, Show, Ord)