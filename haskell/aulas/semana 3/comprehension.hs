type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio", "O Senhor dos Aneis"), ("Andre", "Duna"), ("Fernando", "Amora")]

livros :: BancoDados -> Pessoa -> [Livro]
livros bd p = [ll | (pp,ll) <- bd, pp == p]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd l = [pp | (pp,ll) <- bd, ll == l]

emprestado :: BancoDados -> Livro -> Bool
emprestado bd l = length (emprestimos bd l) > 0
-- ou
-- emprestado bd l = emprestimos l != []

qtdEmprestimos:: BancoDados -> Pessoa -> Int
qtdEmprestimos bd p = length (livros bd p)

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar [] p l = [(p,l)]
emprestar ((p,l):as) pessoa livro 
    | p == pessoa && l == livro = ((p,l):as)
    | otherwise                 = (p,l):emprestar as pessoa livro

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] pessoa livro  = []
devolver ((p,l):as) pessoa livro
    | p == pessoa && l == livro = as
    | otherwise                 = (p,l):devolver as pessoa livro

