-- dopasowanie wzorców

not' :: Bool -> Bool
not' True = False
not' False = True



isItTheAnswer :: String -> Bool
isItTheAnswer "Love" = True 
isItTheAnswer _      = False     -- _ odpowiada ’otherwise’ (lub ’default’ z innych języków)



-- definicje funkcji logicznych

or' :: (Bool,Bool) -> Bool
or' (False,False) = False
or' _ = True


and' :: (Bool, Bool) -> Bool
and' (True, True) = True
and' _ = False


-- dysjunkcja (co najwyżej jedno z dwóch - negacja koniunkcji)
nand' :: (Bool, Bool) -> Bool
nand' (True, True) = False
nand' _ = True


-- alternatywa rozłączna (dokładnie jedno z dwóch)
xor' :: (Bool, Bool) -> Bool
xor' (True, True) = False
xor' (False, False) = False
xor' _ = True
