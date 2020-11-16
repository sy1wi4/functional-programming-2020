-- Funkcje wyższego rzędu: foldr i foldl

sumWith g []     = 0
sumWith g (x:xs) = g x + sumWith g xs -- (+) (g x) (sumWith g xs)

prodWith g []     = 1
prodWith g (x:xs) = g x * prodWith g xs -- (*) (g x) (prodWith g xs)


sumWith' :: Num a => (a -> a) -> [a] -> a
sumWith' = go 0
 where
   go acc g [] = acc
   go acc g (x:xs) = go (g x + acc) g xs


prodWith' :: Num a => (a -> a) -> [a] -> a
prodWith' = go 1
 where
   go acc g [] = acc
   go acc g (x:xs) = go (g x * acc) g xs



-- foldr(ight)
-- np. foldr (+) 0 [1,2,3,4,5] oznacza 1 + (2 + (3 + (4 + (5 + 0))))

-- jeżeli lista wejściowa jest pusta, wynikiem jest wartość początkowa, 
-- w przeciwnym przypadku wywołaj funkcję f na pierwszym elemencie listy 
-- i na wyniku rekurencyjnego wywołania foldr.

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f z [] = z
foldr' f z (x:xs) = f x (foldr' f z xs)


sumWith'' g  = foldr' (\x acc -> g x + acc) 0
prodWith'' g = foldr' (\x acc -> g x * acc) 1


foldl' :: (a -> b -> b) -> b -> [a] -> b
foldl' f z [] = z
foldl' f z (x:xs) = f (foldr' f z xs) x


sumWith''' g  = foldl' (\acc x -> g x + acc) 0
prodWith''' g = foldl' (\acc x -> g x * acc) 1

-- np:
-- foldr (-) 2 [1,3,5] == (1 - (3 - (2 - 5))) == 1
-- foldl (-) 2 [1,3,5] == (((2 - 1) - 3) - 5) == -7
