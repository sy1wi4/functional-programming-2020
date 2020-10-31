-- Rekursja 1

fib :: (Num a, Eq a) => a -> a
fib n =
 if n == 0 || n == 1 
 then n
 else fib (n - 2) + fib (n - 1)
-- złożoność czasowa O(2^n)


sum' :: Num a => [a] -> a
sum' []   = 0
sum' (x:xs) = x + sum' xs


prod' :: Num a => [a] -> a
prod' [] = 1
prod' (x:xs) = x * prod' xs


length' :: [a] -> Int 
length' [] = 0
length' (x:xs) = 1 + length' xs


or' :: [Bool] -> Bool
or' [x] = x
or' (x:xs) = x || or' xs
-- or' [True, False, True] = True


and' :: [Bool] -> Bool 
and' [x] = x
and' (x:xs) = x && and' xs
-- and' [True, False, True] = False



-- sprawdza czy dany element jest w liście
elem' :: Eq a => a -> [a] -> Bool 
elem' el [] = False
elem' el (x:xs) = (x == el) || elem' el xs
-- elem' 3 [1,2,3] = True



doubleAll :: Num t => [t] -> [t] 
doubleAll [] = []
doubleAll (x:xs) = (x * 2) : doubleAll xs
-- doubleAll [1,2] = [2,4]



squareAll :: Num t => [t] -> [t] 
squareAll [] = [] 
squareAll (x:xs) = (x^2) : squareAll xs
-- squareAll [2,3] = [4,9]



selectEven :: Integral t => [t] -> [t] 
selectEven [] = []
selectEven (x:xs) = if x `mod` 2 == 0
    then x : selectEven xs
    else selectEven xs
-- selectEven [1,2,3] = [2]


