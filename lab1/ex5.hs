sgn :: Int -> Int
sgn n = if n < 0
       then -1
       else if n == 0
            then 0
            else 1



-- oblicza wartość bezwzględną liczby całkowitej
absInt :: Int -> Int
absInt a = if a >= 0
    then a
    else -1*a



-- oblicza minimum z dwóch liczb całkowitych
min2Int :: (Int, Int) -> Int 
min2Int (a, b) = if a < b
    then a
    else b



-- oblicza minimum z trzech liczb całkowitych
min3Int :: (Int, Int, Int) -> Int
min3Int (a, b, c) = if a < b
    then if a < c 
        then a
        else c    
    else if b < c
        then b
        else c
        


-- oblicza minimum z trzech liczb całkowitych wykorzystując funkcję min2Int  
min3Int2 :: (Int, Int, Int) -> Int
min3Int2 (a, b, c) = min2Int(min2Int(a,b), c)



-- zamienia małą na wielką literę
-- fromEnum zwraca kod danego znaku z tablicy ASCII (np. fromEnum 'a')
-- toEnum zwaraca znak o danym kodzie z tablicy ASCII (np. toEnum 97::Char)
toUpper :: Char -> Char
toUpper a = toEnum (fromEnum a - 32)::Char



-- zamienia wielką na małą literę
toLower :: Char -> Char
toLower a = toEnum (fromEnum a + 32)::Char
