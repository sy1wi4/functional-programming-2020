-- Rekursja 4


qSort :: Ord a => [a] -> [a]
qSort []     = []
qSort (x:xs) = qSort (leftPart xs) ++ [x] ++ qSort (rightPart xs)
 where
   leftPart  xs = [ y | y <- xs, y <= x ]
   rightPart xs = [ y | y <- xs, y > x  ]



-- Zmodyfikowane funkcje wewnętrzne leftPart i rightPart tak, aby zamiast
-- list comprehensions wykorzystać funkcję filter (z biblioteki standardowej)

qSort' :: Ord a => [a] -> [a]
qSort' []     = []
qSort' (x:xs) = qSort' (leftPart xs) ++ [x] ++ qSort' (rightPart xs)
 where
   leftPart xs = filter (<=x) xs
   rightPart xs = filter (>x) xs
