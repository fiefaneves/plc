data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)

alturaArvore :: Tree t -> Int
alturaArvore Nilt = 0
alturaArvore (Node _ esq dir) = 1 + max (alturaArvore esq) (alturaArvore dir)

-- o diâmetro de uma árvore e maior distância entre entre dois nós.
maiorDiametro :: Ord t => Tree t -> Int
maiorDiametro Nilt = 0
maiorDiametro (Node _ esq dir) = 
    let alturaEsq = alturaArvore esq
        alturaDir = alturaArvore dir
        diametroEsq = maiorDiametro esq
        diametroDir = maiorDiametro dir
    in max (alturaEsq + alturaDir + 1) (max diametroEsq diametroDir)

main = do
       s <- getLine
       let result = maiorDiametro (read s::Tree Int)
       print result