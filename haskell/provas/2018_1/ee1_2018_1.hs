-- 1) Na copa do mundo de futebol, os grupos contém 4 times, e avançam para a fase seguinte os que tem maior número de pontos, sendo 3 pontos por uma vitória, 1 por um empate, e zero por uma derrota.
-- Vamos representar os times e jogos com os tipo de dado e sinonimo de tipos abaixo:
data Time = Australia | Dinamarca | Franca | Peru 
          | Argentina | Croacia | Islandia | Nigeria
  deriving (Eq, Show)

type Jogo = (Time, Int, Time, Int) 
-- Por exemplo: Australia 3 x 1 Dinamarca será representado por (Australia, 3, Dinamarca, 1)

-- a) (2.0) Defina uma função que, dado um time e uma lista de jogos, informe quantos gols aquele time fez.
gols :: Time -> [Jogo] -> Int
gols _ [] = 0
gols t ((t1, g1, t2, g2):rest)
    | t == t1 = g1 + gols t rest
    | t == t2 = g2 + gols t rest
    | otherwise = gols t ts

-- b) (2.0) Defina uma função que, dado um time e uma lista de jogos, qual o seu saldo de gols naquele conjunto de jogos (gols feitos - gols tomados).
saldo :: Time -> [Jogo] -> Int
saldo _ [] = 0
saldo t ((t1, g1, t2, g2):rest)
    | t == t1 = g1 - g2 + saldo t rest
    | t == t2 = g2 - g1 + saldo t rest
    | otherwise = saldo t ts

-- c) (2.0) Defina uma função que, dado um time e uma lista de jogos, informe quantos pontos ele obteve naquele conjunto de jogos.
--Australia [(Australia,2,Dinamarca,3),(Peru,3,Nigeria,5),(Peru,1,Australia,5),(Nigeria,1,Australia,1),(Australia,0,Peru,0)]
pontos :: Time -> [Jogo] -> Int
pontos _ [] = 0
pontos t ((t1, g1, t2, g2):rest)
    | t == t1 && g1 > g2    = 3 + pontos t rest
    | t == t1 && g1 == g2   = 1 + pontos t rest
    | t == t1 && g1 < g2    = pontos t rest
    | t == t2 && g2 > g1    = 3 + pontos t rest
    | t == t2 && g1 == g2   = 1 + pontos t rest
    | t == t2 && g2 < g1    = pontos t rest
    
-- d) (1.0) Defina um tipo de dados para caracterizar um Grupo, que contém o nome do grupo (os grupos vão da letra 'A' à Letra 'H') e 4 times.
data NomedoGrupo = A|B|C|D|E|F|G|H
data Grupo = Group NomedoGrupo Time Time Time Time

-- e) (3.0)  Feito isso, defina uma função que, dado um Grupo e uma lista de jogos, retorne o par de times que estão classificados.
--    Os classificados são: os dois com maior número de pontos; em caso de empate, usa-se o saldo de gols; em caso de continuar empate usa-se o número de gols feitos (há regras adicionais, mas vamos implementar apenas essas 3).
-- exemplos de grupos são: Grupo C: Australia, Dinamarca, Franca, Peru;
--                         Grupo D: Argentina, Croacia, Islandia, Nigeria.