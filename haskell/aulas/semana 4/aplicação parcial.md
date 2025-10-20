## Aplicação Parcial de Funções e Currying em Haskell

Em Haskell, **aplicação parcial** ocorre quando uma função que espera múltiplos argumentos é chamada com menos argumentos do que o necessário. O resultado é uma nova função que espera os argumentos restantes.

Por exemplo:
```haskell
add :: Int -> Int -> Int
add x y = x + y

inc :: Int -> Int
inc = add 1
```
Aqui, `add 1` retorna uma função que soma 1 ao argumento recebido.

O **currying** é o processo de transformar uma função que recebe múltiplos argumentos em uma sequência de funções unárias (cada uma recebe um argumento). Em Haskell, todas as funções são curried por padrão. Assim, `add x y` é interpretado como `(add x) y`.

Esses conceitos permitem criar funções mais flexíveis e reutilizáveis, facilitando a composição funcional.