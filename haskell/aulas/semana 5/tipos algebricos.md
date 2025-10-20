# Tipos Algébricos em Haskell

Tipos algébricos são estruturas de dados definidas pelo usuário que combinam outros tipos. Em Haskell, os principais tipos algébricos são:

```haskell
-- FORMA GERAL
data NomeDoTipo = Construtor1 t11 ... t1k1
                | Construtor2 t21 ... t2k2
                    ...
                | Construtorn tn1 ... Tnkn
```

## Tipos Enumerados/Soma (Sum Types)
Permitem representar alternativas. Usam o construtor `data` com múltiplos casos.

```haskell
data Bool = True | False
data Maybe a = Nothing | Just a
data Estacao = Inverno | Verao | Outono | Primavera
data Temp = Frio | Quente

-- Funções usam casamento de padrões
clima :: Estacao -> Temp
clima Inverno = Frio
clima _       = Quente
```

Exemplo:
```haskell
type Name = String
type Idade = Int
data Pessoas = Pessoa Nome Idade

Pessoa "Jose" 22
Pessoa "Maria" 23

showPerson :: Pessoas -> String
showPerson (Pessoa n i) = n ++ " -- " ++ show a

Pessoa :: Nome -> Idade -> Pessoas
```

## Tipos Produto (Product Types)
Combinam múltiplos valores em uma única estrutura.

```haskell
data Point = Point Float Float
```

## Tipos Recursivos
Permitem definir estruturas como listas e árvores.
```haskell
-- FORMA GERAL
data Expr = Lit Int         |
            Add Expr Expr   |
            Sub Expr Expr

eval :: Expr -> Int
eval (Lit n)        = n
eval (Add e1 e2)    = (eval e1) + (eval e2)
eval (Sub e1 e2)    = (eval e1) + (eval e2)  
```

### Tipos Polimórficos

```haskell
data Pairs t = Pair t t
Pair 6 8 :: Pairs Int
Pair True True :: Pairs Bool
Pair [] [1,3] :: Pairs [Int]
```
```haskell
-- Listas
data List a = Nil | Cons a (List a)
-- Árvores
data Tree t = NilT | Node t (Tree t) (Tree t)
```

### Instâncias
É possível criar um tipo algébrico como instância de uma classe
```haskell
data Tree t = NilT | 
              Node t (Tree t) (Tree t)
              deriving (Eq, Show, Ord) -- tipo Tree t é instância dessas Classes

-- Com essa derivação podemos fazer coisas como:
-- Eq
> NilT == NilT 
> True

> Node 3 NilT NilT = Node 3 NilT NilT
> True

> Node 3 NilT NilT = Node 3 NilT (Node 4 NilT NilT)
> False

-- Show
> show $ Node 3 NilT (Node 4 NilT NilT)
> "Node 3 NilT (Node 4 NilT NilT)"

-- Ord -- apenas checa o valor do root
> NilT > Node 3 NilT (Node 4 NilT NilT)
> False

> Node 4 NilT NilT > Node 3 NilT NilT
> True

> Node 4 NilT NilT > Node 3 NilT (Node 5 NilT NilT) 
> True
```

## Vantagens
- Segurança de tipos
- Expressividade
- Facilita pattern matching

### Por que não usar tuplas?
```haskell
type Nome = String
type Idade = Int
type Pessoas = (Nome, Idade)
```
- Mais compacto, definições mais curtas
- Maior probabilidade de reusar funções polimórficas
```haskell
data Pessoas = Pessoa Nome Idade
```
- Cada objeto do tipo tem um rótulo explícito
- Não se pode confundir um tipo com outro, devido ao construtor (definições fortemente tipadas)
- Tipos Recursivos e enumerados

## Exemplos Comuns
- `Maybe a` para valores opcionais
- `Either a b` para representar sucesso ou erro
```haskell
data Shape = Circle Float | Rectangle Float Float
Circle 4.9 :: Shape
Rectangle 4.2 2.0 :: Shape

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False

area :: Shape -> Float
area (Circle r) = 3,14 *r*r
area (Rectangle l1 l2) = l1*l2
```

Tipos algébricos são fundamentais para programação funcional e modelagem de dados em Haskell.