-- Dopasowanie wzorców: guards

fst2Eq :: Eq a => [a] -> Bool
fst2Eq (x : y : _) | x == y = True
fst2Eq _                    = False


-- czy pierwszy element listy jest podzielnikiem drugiego
divider :: (Eq a, Integral a) => [a] -> Bool
divider (x : y : _) | y `mod` x == 0 = True
divider _                    = False


--  czy pierwszy element listy jest podzielnikiem trzeciego
divider3 :: (Eq a, Integral a) => [a] -> Bool
divider3 (x : y : z : _) | z `mod` x == 0 = True
divider3 _                    = False
