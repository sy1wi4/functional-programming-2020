-- List comprehensions

-- ile jest w przedziale [1,100] trójek liczb całkowitych reprezentujących 
-- długości boków trójkąta prostokątnego

rect_triangle = length 
    [(a, b, c) | a <- [1..100], b <- [a..100], c <- [b..100], a^2 + b^2 == c^2] 


isPrime :: Integral t => t -> Bool
isPrime n = [i | i <- [2..n-1], n `mod` i == 0] == []
-- ta implementacja nie jest efektywna, ponieważ wystarczy sprawdzać do sqrt(n) 
-- ponadto np. dla 0 zwraca prawdę, co nie jest poprawne - należy sprawdzić, czy liczba jest
-- niemniejsza od 2


