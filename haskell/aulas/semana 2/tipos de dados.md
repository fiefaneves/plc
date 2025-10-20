# Tipos Básicos de Dados em Haskell

Haskell possui uma tipagem forte e estática. Alguns tipos básicos incluem:

- **Int**: Números inteiros - precisão fixa (bounded)(ex: `42 :: Int`)
- **Integer**: Inteiros de precisão arbitrária (ex: `12345678901234567890 :: Integer`)
- **Float**: Números de ponto flutuante de precisão simples (ex: `3.14 :: Float`)
- **Double**: Ponto flutuante de precisão dupla (ex: `2.71828 :: Double`)
- **Char**: Caracteres únicos (ex: `'a' :: Char`)
- **Bool**: Valores booleanos (`True` ou `False`)

## Notação
- A anotação de tipo é feita usando `::`, por exemplo:  
    ```haskell
    x :: Int
    x = 10
    ```

### Exemplos
```haskell
idade :: Int
idade = 21

nome :: String
nome = "Ana"

par :: (Int, Bool)
par = (7, True)
```

- Maiúscula:
    - Tipos e Construtores (Tuplas, Listas, tipos algébricos)
- Minúscula:
    - Funções, variáveis e parâmetros
- Case sensitive
- Identação
- Comentários:
    ```haskell
    -- isso é um comentário de uma linha
    {- isso é um comentário de várias linhas -}
    ```
- Funções tem a maior precedência
    ```haskell
    f n + 1 -- = (f n) + 1 --> Soma 1 no retorno da função
    f (n + 1) 
    ```
- Suporte para notação infixada e prefixada
    ```haskell
    2 + 3       -- = 5
    (+) 2 3     -- = 5

    -- função 
    maxi 2 4
    2 `maxi` 4
    ```
- Definições Locais
    ```haskell
    sumSquares :: Int -> Int -> Int
    -- definição de variável
    sumSquares x y = sqX + sqY
        where sqX = x * x
              sqY = y * y
    -- ou -- definição de função
    sumSquares x y = sq x + sq y
        where sq z = z * z
    -- ou -- definição antes de serem usadas
    sumSquares x y = let sqX = x * x
                         sqY = y * y
                    in sqX + sqY

    ```
    - **let** definições **in** expressão
    - definições **where** definições

- Números inteiros
    - **"1, 2, 3, ..."** :: Int
    - **"+, mult(*), -, ^, div, mod, abs, negate"** :: Int -> Int -> Int
    - **">, >=, ==, /=, <=, <"** :: Int -> Int -> Bool

- Booleanos 
    - **True, False** :: Bool
    - **&&, ||** :: Bool -> Bool -> Bool
    - **not** :: Bool -> Bool (é uma função em haskell)

### Exemplos:
```haskell
-- ou exclusivo
xor :: Bool -> Bool -> Bool
xor x y = (x || y) && not (x && y)
-- outra forma (Casamento de Padrões)
eXor :: Bool -> Bool -> Bool
eXor True x = not x
exor False x = x
```
- Caracteres
    - **'a', 'b', ...** :: Char
    - **'\t', '\n', '\\', '\'', '\"'** :: Char
    - **ord** :: Char -> Int
    - **chr** :: Int -> Char
        - No GHC, parte da biblioteca Data.Char

### Exemplo
```haskell
import Data.Char

offset = ord 'A' - ord 'a'

maiuscula :: Char -> Char
maiuscula ch = chr (ord ch + offset)

-- Comparação de caracteres
ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')
```
```haskell
-- alternativa sem importar biblioteca
fromEnum :: Char -> Int
toEnum :: Int -> Char

offset = fromEnum 'A' - fromEnum 'a'
maiuscula :: Char -> Char
maiuscula ch = toEnum (fromEnum ch + offset)

```

- Strings
    - **"abc", "Fernando"**:: String
    - **(++)** :: String -> String -> String (concatenação)
    - **show** :: ? -> String (overloading)
    - **' ', "" e " "** são diferentes!!
        - ' ' -> Caractere espaço em branco
        - "" -> String vazia
        - " " -> String com um caractere espaço em branco

### Exemplos
```haskell
> "peixe" ++ "\n" ++ "gato" ++ "\n"
"peixe\ngato\n"
> putStr ("peixe" ++ "\n" ++ "gato" ++ "\n")
peixe
gato
```

- Números reais - Ponto Flutuante - Float e Double
    - 22.3435
    - **+, -, mult(*), /** :: Float -> Float -> Float
        - Divisão de ponto flutuante não é com div
    - pi :: Float
    - **ceiling, floor, round** :: Float -> Int
    - **fromIntegral** :: Int -> Float
    - **read** :: String -> ? (overloading)
    - **show** :: Float -> String