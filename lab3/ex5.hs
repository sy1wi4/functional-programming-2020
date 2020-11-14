-- Operator złożenia funkcji (.) (i notacja point-free)


import Data.List
sortDesc :: Ord a => [a] -> [a]
sortDesc xs = reverse . sort $ xs


-- sortDesc' = reverse . sort   ???

f = (+1)
h = (^3)
w3 = \x y z -> sqrt (x^2 + y^2 + z^2)
