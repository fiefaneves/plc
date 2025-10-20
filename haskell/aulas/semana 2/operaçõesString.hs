-- Exemplos de funções sobre String já existentes em Haskell

import Data.Char (toUpper, toLower, isDigit)
import Data.List (isPrefixOf, isSuffixOf, isInfixOf, intercalate, words, unwords)

-- Funções básicas:
length "hello"                -- 5
reverse "hello"               -- "olleh"
take 3 "hello"                -- "hel"
drop 2 "hello"                -- "llo"
concat ["foo", "bar"]         -- "foobar"
replicate 3 "ha"              -- "hahaha"

-- Funções de Data.Char:
map toUpper "hello"           -- "HELLO"
map toLower "HELLO"           -- "hello"
filter isDigit "abc123"       -- "123"

-- Funções de Data.List:
isPrefixOf "he" "hello"       -- True
isSuffixOf "lo" "hello"       -- True
isInfixOf "ll" "hello"        -- True
intercalate "," ["a","b","c"] -- "a,b,c"
words "hello world"           -- ["hello","world"]
unwords ["hello","world"]     -- "hello world"