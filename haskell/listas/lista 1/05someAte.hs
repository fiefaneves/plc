-- Usando recursão, implemente a função sumTo, de modo que sumTo n calcula o valor de 1 + 2 + ... + n.
sumTo :: Int -> Int
sumTo 0 = 0
sumTo n = n + sumTo (n-1)

main :: IO()
main = interact $ show . sumTo . read

{-
Input
A entrada será de um único número no formato:
N

Output
A saída deve ser um único número no formato:
O

Examples
Case: 1
Input
2
Output
3

Case: 2
Input
5
Output
15
-}