--  Definicja funkcji: sections


fiveToPower_ :: Integer -> Integer
fiveToPower_ = (5^)


_ToPower5 :: Num a => a -> a
_ToPower5 = (^5)


subtrNFrom5 :: Num a => a -> a
subtrNFrom5 = (5-) 


subtr5From_ :: Num a => a -> a
subtr5From_ = flip (-) 5
-- (-5) = flip (-) 5


flip2 :: (a -> b -> c) -> b -> a -> c
flip2 f x y = f y x
-- dostaje funkcję akceptującą 2 argumenty, zwraca tę funkcję
-- dla 2 kolejnych argumentów w odwróconej kolejności 


