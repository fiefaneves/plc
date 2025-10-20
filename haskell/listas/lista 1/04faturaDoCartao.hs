{----------------------------------------
Data;Tipo;Compra;Valor;
14 JAN;Amazon;40.32;
15 JAN;Uber;14.84;
25 JAN;Uber;34.24;
02 FEV;Spotify;8.50;
06 FEV;Uber;6.94;
05 MAR;Burger;29.90;
10 MAR;Burger;24.99;
15 MAR;UCI;19.00;
08 ABR;Itunes;3.50;
13 ABR;Picpay;20.00;
----------------------------------------}

-- input
-- "14 JAN;Amazon;40.32;15 JAN;Uber;14.84;25 JAN;Uber;34.24;02 FEV;Spotify;8.50;06 FEV;Uber;6.94;05 MAR;Burger;29.90;10 MAR;Burger;24.99;15 MAR;UCI;19.00;08 ABR;Itunes;3.50;13 ABR;Picpay;20.00;"

split :: Char -> String -> [String]
split _ [] = []
split sep str = 
    let (before, after) = break (== sep) str
    in before : case after of
                    [] -> []
                    (_:rest) -> split sep rest

-- recebe uma String JAN, FEV, MAR ou ABR e uma String referente a uma fatura anual e retorna o total gasto no mês em questão
-- ATENÇÃO: Vários alunos reportaram problemas com a precisão da saída (já que está sendo utilizado um Double). Se estiver tendo problemas com a precisão do resultado, considere utilizar a função foldl.
logMes :: String -> String -> Double
logMes mes fatura = 
    let transacao = filter (/= "") (split ';' fatura)
        valoresMes = extrairValoresMes mes transacao
    in foldl (+) 0.0 valoresMes

    {-
    ghci> :t elem
    elem :: (Foldable t, Eq a) => a -> t a -> Bool
    ghci> :t words
    words :: String -> [String]
    -}

    where
        extrairValoresMes :: String -> [String] -> [Double]
        extrairValoresMes _ [] = []
        extrairValoresMes m (dt:tipo:valor:rest)
            | mes `elem` words dt = read valor : extrairValoresMes m rest
            | otherwise = extrairValoresMes m rest

main :: IO ()
main = do
    a <- getLine
    b <- getLine
    let result = logMes a b
    print result