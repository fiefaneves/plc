# List Comprehension em Haskell

List comprehension em Haskell é uma forma concisa e poderosa de criar listas a partir de outras listas, aplicando filtros e transformações. Sua sintaxe é inspirada na notação matemática dos conjuntos.

## Sintaxe Básica

```haskell
[expressão | variável <- lista, condição]
```

- `expressão`: valor a ser incluído na nova lista.
- `variável <- lista`: itera sobre os elementos da lista.
- `condição`: (opcional) filtra elementos.

## Exemplos

```haskell
[x*2 | x <- [1..5]]                 -- [2,4,6,8,10]
[x | x <- [1..10], even x]          -- [2,4,6,8,10]
[(x,y) | x <- [1,2], y <- [3,4]]    -- [(1,3),(1,4),(2,3),(2,4)]
[x^2 | x <- [1..10]]                -- [1,4,9,16,25,36,49,64,81,100]
[0 | x <- [1..10]]                  -- [0,0,0,0,0,0,0,0,0,0]
[x | x <- [1..20], x `mod` 7 == 0]  -- [7,14]
[x | x <- [1..20], x `mod` 7 == 0 || x `mod` 3 == 0]  -- [3,6,7,9,12,14,15,18]
```

## Vantagens

- Código mais legível e expressivo.
- Permite múltiplos geradores e filtros.
- Facilita operações complexas sobre listas.

## Observação

List comprehensions são usadas principalmente para manipulação de listas, mas podem ser adaptadas para outros tipos de coleções usando funções apropriadas.
