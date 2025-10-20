# Tuplas em Haskell

- **Definição**: Tuplas são estruturas que agrupam múltiplos valores, possivelmente de tipos diferentes, em um único valor.
- **Sintaxe**: Os elementos são separados por vírgulas e delimitados por parênteses.  
    Exemplo: `(1, "abc", True)`
- **Acesso**: Não há acesso direto por índice. Para tuplas de dois ou três elementos, use funções como `fst`, `snd`, ou pattern matching.
- **Imutabilidade**: Tuplas são imutáveis após a criação.
- **Tipos**: O tipo de uma tupla depende do número e tipo dos elementos.  
    Exemplo: `(Int, String, Bool)`
- **Uso comum**: Retornar múltiplos valores de funções, agrupar dados heterogêneos.
- **Exemplos:**
```haskell
intP :: (Int, Int)
intP = (33,44)

(True, 'x') :: (Bool, Char)
(34, 22, 'b') :: (Int, Int, Char)

addPair :: (Int, Int) -> Int
addPair (x,y) = x + y

shift :: ((Int, Int), Int) -> (Int, (Int, Int))
shift ((x,y),z) = (x, (y,z))
```

## Sinônimos de tipos:
```haskell
type Name = String
type Age = Int
type Phone = Int

type Person = (Name, Age, Phone)

name :: Person -> Name
name (n,a,p) = n
```

```haskell
-- Exemplo de função que retorna uma tupla
divModPair :: Int -> Int -> (Int, Int)
divModPair x y = (div x y, mod x y)
```