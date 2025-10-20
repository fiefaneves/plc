data Tree t = Node t (Tree t) (Tree t) 
              | Nilt
              deriving (Read)

alturaArvore :: Tree t -> Int
alturaArvore Nilt = 0
alturaArvore (Node _ esq dir) = 1 + max (alturaArvore esq) (alturaArvore dir)

main = do
       a <- getLine
       let result = alturaArvore (read a::Tree Int)
       print result