data Cmd = Cursor Int
           | Backspace Int
           | Delete Int
           | Insert String
           deriving (Read)

{- Cursor X: anda o cursor X casas para frente (números positivos) 
ou para trás (números negativos).-}

{-Backspace X: Apaga X caracteres atrás do cursor (não inclui o caractere 
apontado pelo cursor). Tenha em mente que esse operador também muda 
a posição do cursor-}
backspace :: String -> Int -> Int -> String
backspace str p 0 = str
backspace str p n = take (p-n) str ++ drop p str

{- Delete X: Apaga X caracteres na frente do cursor 
(inclui o caractere apontado pelo cursor).-}
delete :: String -> Int -> Int -> String
delete str p n = take p str ++ drop (p+n) str

{-Insert S: Insere a String S na posição do cursor 
(o caractere apontado pelo cursor vai aparecer imediatamente depois de S). 
O cursor vai passar a apontar para o começo da String inserida-}

insert :: String -> Int -> String -> String
insert str p s = take p str ++ s ++ drop p str

processCmd :: String -> Int -> [Cmd] -> String
processCmd str _ [] = str
processCmd str pos (Cursor n:rest) = processCmd str (pos+n) rest
processCmd str pos (Backspace n:rest) = processCmd (backspace str pos n) (pos-n) rest
processCmd str pos (Delete n:rest) = processCmd (delete str pos n) pos rest
processCmd str pos (Insert s:rest) = processCmd (insert str pos s) pos rest

editText :: String -> [Cmd] -> String
editText str cmds = processCmd str 0 cmds

main = do
       a <- getLine
       b <- getLine
       let result = editText a (read b)
       print result

{-
This is a test text
[Cursor 7, Insert "not", Cursor 7, Delete 9, Insert "simulation"]

"This isnot a testsimulation"

"This is not a simulation"
-}