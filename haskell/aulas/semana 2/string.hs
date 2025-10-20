import Text.Printf

-- Função que adiciona n espaços no início de uma string
addEspacos :: Int -> String
addEspacos n | n <= 0    = ""
             | otherwise = ' ' : addEspacos (n - 1)

{-main :: IO ()
main = do
    putStrLn "Testando addEspacos:"
    putStrLn ("5 espaços: ->" ++ addEspacos 5 ++ "<-")
    putStrLn ("10 espaços: ->" ++ addEspacos 10 ++ "<-")
    putStrLn ("0 espaços: ->" ++ addEspacos 0 ++ "<-")
    putStrLn ("-2 espaços: ->" ++ addEspacos (-2) ++ "<-")-}

-- adicionar uma quantidade n de espaços à esquerda de um dado
-- String, s -> String
paraDireita :: Int -> String -> String
paraDireita n s = addEspacos n ++ s

{-main :: IO ()
main = do
    putStrLn "Testando paraDireita:"
    putStrLn (paraDireita 5 "Olá")
    putStrLn (paraDireita 10 "Mundo")
    putStrLn (paraDireita 0 "Sem espaços")-}

-- função para retornar, em forma de tabela, todas as vendas da semana 0 até a semana n
vendas :: Int -> Int
vendas sem = mod sem 17

totalVendas :: [Int] -> Int
totalVendas lista = sum lista

{-geraRelatorio :: Int -> String
geraRelatorio n = unlines [
        cabecalho,
        divisor,
        linhasSemanas,
        divisor,
        linhaTotal,
        linhaMedia
    ]
    where
    -- --- Cálculos ---
        -- Gera a lista de valores de vendas para o período.
        vendasDoPeriodo = [vendas sem | sem <- [0..n]]
        -- Calcula o total de vendas.
        total = totalVendas vendasDoPeriodo
        -- Calcula a média. `fromIntegral` converte Int para um tipo numérico mais geral
        -- que pode ser usado em divisão de ponto flutuante.
        media :: Double
        media = fromIntegral total / fromIntegral (n + 1)

        -- --- Formatação ---
        -- Define as larguras das colunas para alinhamento.
        larguraSemana = 8
        larguraVenda  = 6

        -- Cria o cabeçalho da tabela.
        cabecalho = paraDireita larguraSemana "Semana" ++ paraDireita larguraVenda "Venda"
        divisor = replicate (larguraSemana + larguraVenda) '-'

        -- Função auxiliar para formatar uma única linha da tabela.
        formataLinha :: Int -> Int -> String
        formataLinha semana valor =
            paraDireita larguraSemana (show semana) ++ paraDireita larguraVenda (show valor)

        -- Gera todas as linhas de vendas, uma por semana, e as une com quebras de linha.
        linhasSemanas = unlines (zipWith formataLinha [0..n] vendasDoPeriodo)

        -- Formata a linha do total.
        linhaTotal = paraDireita larguraSemana "Total" ++ paraDireita larguraVenda (show total)

        -- Formata a linha da média, usando printf para limitar as casas decimais.
        linhaMedia = paraDireita larguraSemana "Média" ++ paraDireita larguraVenda (printf "%.2f" media)


-- =================================================================
-- 3. FUNÇÃO MAIN PARA EXECUTAR E TESTAR O CÓDIGO
-- =================================================================

main :: IO ()
main = do
    putStrLn "--- Relatório de Vendas (0 a 5 semanas) ---"
    putStrLn (geraRelatorio 5)

    putStrLn "\n--- Relatório de Vendas (0 a 10 semanas) ---"
    putStrLn (geraRelatorio 10)-}

-- OU

-- =================================================================
-- 2. NOVAS FUNÇÕES DE GERAÇÃO DE STRING
-- =================================================================

-- Retorna o cabeçalho da tabela como uma String.
-- O `\n` no final garante a quebra de linha.
cabecalho :: String
cabecalho = paraDireita 8 "Semana" ++ paraDireita 6 "Venda" ++ "\n" ++ replicate 14 '-' ++ "\n"

-- Gera uma string contendo todas as linhas de vendas.
imprimeSemanas :: Int -> String
imprimeSemanas n = unlines (map formataLinhaSemana [0..n])
  where
    -- Função auxiliar que formata uma única linha.
    formataLinhaSemana :: Int -> String
    formataLinhaSemana semana =
        paraDireita 8 (show semana) ++ paraDireita 6 (show (vendas semana))

-- Calcula e formata a linha do total.
imprimeTotal :: Int -> String
imprimeTotal n = paraDireita 8 "Total" ++ paraDireita 6 (show total) ++ "\n"
  where
    vendasDoPeriodo = [vendas sem | sem <- [0..n]]
    total = sum vendasDoPeriodo

-- Calcula e formata a linha da média.
imprimeMedia :: Int -> String
imprimeMedia n = paraDireita 8 "Média" ++ paraDireita 6 (printf "%.2f" media) ++ "\n"
  where
    vendasDoPeriodo = [vendas sem | sem <- [0..n]]
    total = sum vendasDoPeriodo
    
    media :: Double
    media = fromIntegral total / fromIntegral (n + 1)

-- =================================================================
-- 3. FUNÇÃO PRINCIPAL DE IMPRESSÃO (IO)
-- =================================================================

-- Função principal que imprime a tabela na tela.
imprimeTabela :: Int -> IO ()
imprimeTabela n = putStr (cabecalho
                       ++ imprimeSemanas n
                       ++ "--------------\n" -- Adicionando um divisor
                       ++ imprimeTotal n
                       ++ imprimeMedia n)

-- Função main para executar e testar o código
main :: IO ()
main = do
    putStrLn "--- Relatório de Vendas (0 a 10 semanas) ---"
    imprimeTabela 10