-- Uma Árvore pode ser uma Folha (vazia) ou um Nó com um valor,
-- uma sub-árvore esquerda e uma sub-árvore direita.
data Arvore = Folha | No Int Arvore Arvore deriving (Show)

--      10
--     /  \
--    5    15
--   / \   /
--  3   7 12

arvoreExemplo :: Arvore
arvoreExemplo = No 10
                  (No 5 (No 3 Folha Folha) (No 7 Folha Folha))
                  (No 15 (No 12 Folha Folha) Folha)

inOrder :: Arvore -> [Int]
inOrder Folha = []
inOrder (No valor esq dir) =
    (inOrder esq) ++ [valor] ++ (inOrder dir)

preOrder :: Arvore -> [Int]
preOrder Folha = []
preOrder (No valor esq dir) =
    [valor] ++ (preOrder esq) ++ (preOrder dir)

postOrder :: Arvore -> [Int]
postOrder Folha = []
postOrder (No valor esq dir) =
    (postOrder esq) ++ (postOrder dir) ++ [valor]

-- Função principal que inicia a verificação com os limites mais amplos possíveis.
isBST :: Arvore -> Bool
isBST arvore = isBSTAux arvore minBound maxBound
  where
    -- Função auxiliar que carrega os limites (minLim, maxLim).
    isBSTAux :: Arvore -> Int -> Int -> Bool
    isBSTAux Folha _ _ = True -- Uma árvore vazia é uma BST.
    isBSTAux (No valor esq dir) minLim maxLim =
      -- 1. O valor atual deve estar dentro dos limites.
      valor >= minLim &&
      valor <= maxLim &&
      -- 2. Verifica a sub-árvore esquerda, atualizando o limite SUPERIOR.
      isBSTAux esq minLim valor &&
      -- 3. Verifica a sub-árvore direita, atualizando o limite INFERIOR.
      isBSTAux dir valor maxLim