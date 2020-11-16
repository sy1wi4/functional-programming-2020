-- Operator złożenia funkcji (.) (i notacja point-free)

-- infix, infixl, infixr -> priorytet: [0..9]

-- operator (.) - infixr 9 oznacza najwyższy priorytet (łączność prawostronna (r))


import Data.List
sortDesc :: Ord a => [a] -> [a]
sortDesc xs = reverse . sort $ xs


-- sortDesc' = reverse . sort   ???


f = (+1)
g = (*2) 
h = (^3)

fg = f.g
gh = g.h
fgh = f.g.h

w3 = \x y z -> sqrt (x^2 + y^2 + z^2)
