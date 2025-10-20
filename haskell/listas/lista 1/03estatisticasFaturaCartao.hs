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
--input:
-- "14 JAN;Amazon;40.32;15 JAN;Uber;14.84;25 JAN;Uber;34.24;02 FEV;Spotify;8.50;06 FEV;Uber;6.94;05 MAR;Burger;29.90;10 MAR;Burger;24.99;15 MAR;UCI;19.00;08 ABR;Itunes;3.50;13 ABR;Picpay;20.00;"

split :: Char -> String -> [String]
split _ [] = []
split sep str = 
    let (before, after) = break (== sep) str -- divide a string em duas partes (antes do ; e dps do ;)
    in before : case after of
                    [] -> []
                    (_:rest) -> split sep rest

-- recebe uma String referente a fatura anual e retorna uma tupla com o menor e o maior dos valores gastos
minMaxCartao :: String -> (Double, Double)
minMaxCartao fatura = 
    let transacao = filter (/= "") (split ';' fatura)
        valores = extrairValores transacao
    in case valores of
        [] -> (0.0, 0.0)
        xs -> (minimum xs, maximum xs)

    where
        extrairValores :: [String] -> [Double]
        extrairValores [] = []
        extrairValores (_:_:valor:rest) = read valor : extrairValores rest
        extrairValores _ = []

main :: IO ()
main = do
    a <- getLine
    let result = minMaxCartao a
    print result