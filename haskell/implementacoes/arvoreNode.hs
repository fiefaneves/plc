-- Uma Árvore pode ser uma Folha (vazia) ou um Nó com um valor,
-- uma sub-árvore esquerda e uma sub-árvore direita.
data Tree t = Node t (Tree t) (Tree t) | Nilt deriving (Show)

--      10
--     /  \
--    5    15
--   / \   /
--  3   7 12

arvoreExemplo :: Tree Int
arvoreExemplo = Node 10
                  (Node 5 (Node 3 Nilt Nilt) (Node 7 Nilt Nilt))
                  (Node 15 (Node 12 Nilt Nilt) Nilt)

inOrder :: Tree Int -> [Int]
inOrder Nilt = []
inOrder (Node valor esq dir) =
    inOrder esq ++ [valor] ++ inOrder dir

preOrder :: Tree Int -> [Int]
preOrder Nilt = []
preOrder (Node valor esq dir) =
    [valor] ++ preOrder esq ++ preOrder dir

postOrder :: Tree Int -> [Int]
postOrder Nilt = []
postOrder (Node valor esq dir) =
    postOrder esq ++ postOrder dir ++ [valor]

isBST :: Tree Int -> Bool
isBST arvore = isBSTAux arvore minBound maxBound
  where
    isBSTAux :: Tree Int -> Int -> Int -> Bool
    isBSTAux Nilt _ _ = True
    isBSTAux (Node valor esq dir) minLim maxLim =
      valor >= minLim &&
      valor <= maxLim &&
      isBSTAux esq minLim (valor - 1) &&
      isBSTAux dir (valor + 1) maxLim