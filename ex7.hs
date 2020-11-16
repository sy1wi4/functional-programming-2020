-- Funkcje wyższego rzędu: filter

import Data.Char

onlyEven [] = []
onlyEven (x:xs)
 | x `mod` 2 == 0 = x : onlyEven xs
 | otherwise      = onlyEven xs


onlyOdd [] = []
onlyOdd (x:xs)
 | x `mod` 2 == 1 = x : onlyOdd xs
 | otherwise      = onlyOdd xs


onlyUpper [] = []
onlyUpper (x:xs)
 | isUpper(x) == True = x : onlyUpper xs
 | otherwise      = onlyUpper xs


filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs)
 | p x == True = x : filter' p xs
 | otherwise   = filter' p xs


onlyEven' = filter' (\x -> x `mod` 2 == 0)

onlyOdd' = filter' (\x -> x `mod` 2 == 1)

onlyUpper' = filter' isUpper


-- :set +s  -> czas wykonania


-- length (onlyEven [1..10^6])
-- length (filter even [1..10^6])

-- Zmodyfikować powyższe wyrażenia tak, aby nie zawierały nawiasów (użyć . i/lub $)
-- length $ onlyEven [1..10^6]
-- length $ filter even [1..10^6]


-- Przepisać używając list comprehensions
-- length (filter even [1..10^6])
length([x | x <- [1..10^6], x `mod` 2 == 0])
