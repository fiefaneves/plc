-- Q4
data Grafo = Grafo [(Int, [Int])] deriving (Show)
-- Estrutura: [(nó, [lista_de_adjacentes])]

mapEdges :: (Int -> Int -> Int) -> Grafo -> (Int -> [Int])
mapEdges f (Grafo g) = \n -> case lookup n g of
    Nothing -> []
    Just adjacentes -> map (f n) adjacentes


exemploGrafo :: Grafo
exemploGrafo = Grafo [(10, [7, 4]), (7, [2]), (4, [1]), (2, []), (1, [])]