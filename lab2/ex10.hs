-- Dopasowanie wzorców: guards

fst2Eq :: Eq a => [a] -> Bool
fst2Eq (x : y : _) | x == y = True
fst2Eq _                    = False


divider :: (Eq a, Integral a) => [a] -> Bool
divider (x : y : _) | y `mod` x == 0 = True
divider _                    = False
