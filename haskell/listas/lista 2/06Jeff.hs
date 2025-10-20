-- Conversão de Sistemas de Notas
-- EUA -> alfabético ('A', 'B', 'C', 'D', 'F' e considera subvariantes compostas pelos sufixos '+' ou '-', exceto na nota 'F')
-- BR -> numérico [0,0.1..10]

--  'A+' = 9.7; 'A' = 9.3 e 'A-' = 9.0. 
-- As notas B, C e D derivam das notas A's, sendo: B = A - 1, C = B - 1 e D = C - 1 
-- (inclusas, também, as subvariantes: "B-" = "A-" - 1, "D+" = "C+" - 1, por exemplo), 
-- e F = 5.9.

convertUStoBR :: [String] -> [Float]
convertUStoBR [] = []
convertUStoBR (x:xs)
    | x == "A+" = 9.7 : convertUStoBR xs
    | x == "A" = 9.3 : convertUStoBR xs
    | x == "A-" = 9.0 : convertUStoBR xs
    | x == "B+" = 8.7 : convertUStoBR xs
    | x == "B" = 8.3 : convertUStoBR xs
    | x == "B-" = 8.0 : convertUStoBR xs
    | x == "C+" = 7.7 : convertUStoBR xs
    | x == "C" = 7.3 : convertUStoBR xs
    | x == "C-" = 7.0 : convertUStoBR xs
    | x == "D+" = 6.7 : convertUStoBR xs
    | x == "D" = 6.3 : convertUStoBR xs
    | x == "D-" = 6.0 : convertUStoBR xs
    | x == "F" = 5.9 : convertUStoBR xs

media :: [Float] -> Float
media notas = (somNotas notas) / fromIntegral (length notas)
    where
        somNotas :: [Float] -> Float
        somNotas [] = 0
        somNotas (x:xs) = x + somNotas xs

{-
Se a média for >= 9.7, então ela será convertida para "A+"; 
se for >= 9.3 e < 9.7, então ela será convertida para "A"; 
por fim, se for >= 9.0 e < 9.3, ela será convertida para "A-". 
Novamente, a lógica da conversão das notas B, C e D derivam das notas A's, subtraindo 1; 
e uma média < 6 será convertida para a nota F.
-}

convertBRtoUS :: Float -> String
convertBRtoUS x
    | x >= 9.7 = "A+"
    | x >= 9.3 && x < 9.7 = "A"
    | x >= 9.0 && x < 9.3 = "A-"
    | x >= 8.7 = "B+" 
    | x >= 8.3 && x < 8.7 = "B"
    | x >= 8.0 && x < 8.3 = "B-"
    | x >= 7.7 = "C+" 
    | x >= 7.3 && x < 7.7 = "C"
    | x >= 7.0 && x < 7.3 = "C-"
    | x < 6 = "F"


contagemNotas :: [String] -> [String] -> Int
contagemNotas notasUS faculdades = 
    let notaConvertida = media (convertUStoBR notasUS)
        notasFaculdades = convertUStoBR faculdades
    in length (filter (<=(notaConvertida)) notasFaculdades)

main = do
    a <- getLine
    b <- getLine
    print (contagemNotas (read a) (read b))