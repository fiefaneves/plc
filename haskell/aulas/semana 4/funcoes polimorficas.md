# Resumo de Funções Polimórficas em Haskell

- **Funções polimórficas** são funções que podem operar sobre diferentes tipos de dados.
- Em Haskell, o polimorfismo é geralmente alcançado usando **tipos genéricos**.
- Exemplo clássico:  
    ```haskell
    length :: [a] -> Int
    ```
    Aqui, `a` é um tipo genérico, então `length` funciona para listas de qualquer tipo.
- O polimorfismo permite reutilização de código e maior flexibilidade.
- Haskell também suporta **polimorfismo ad-hoc** via *typeclasses*, como:
    ```haskell
    show :: Show a => a -> String
    ```
    `Show a =>` indica que `a` deve pertencer à typeclass `Show`.
- Funções polimórficas são fundamentais para programação funcional e abstração em Haskell.

## Overloading: 
- Mesmo nome de função, mas definições distintas para cada tipo
- **Classe:** coleção de tipos para os quais uma funçõa está definida
    - O conjunto de tipos para os quais (==) está definida é a **classe igualdade, `Eq`**
    - Exemplos: `Eq`, `Ord`, `Show`
```haskell
:: Int -- Encontrar a classe de tipos
```
- **Instância:** Tipos membros de uma classe
    - `Int` é uma instância da classe `Eq`

- **Exemplos:**
```haskell
-- allEqual :: Int -> Int -> Int -> Bool
-- maneira polimorfica
allEqual :: Eq t -> t -> t -> t -> Bool
allEqual n m p = (n==m) && (m==p)

-- member :: [Char] -> Char -> Bool
member :: Eq t -> [t] -> t -> Bool
member [] b = False
     | (a:as) b = (a==b)
     | otherwise member as b
```

- **Classes predefinidas:**
```haskell
show :: Show t=> t -> String
read :: (Read t) => String -> t
(+) :: Num a => a -> a -> a
(>) :: Ord a => a -> a -> Bool
```