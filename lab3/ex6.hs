-- Operator “aplikacji” funkcji ($)

-- wszystko co stoi za "$" ma pierwszeństwo

-- (((,) $ 1) $ 2) == (1,2)

f = (+1)
g = (*2) 
h = (^3)

-- f . $ g . h 3   dodać nawiasy tak żeby wyszło 55
-- f  $ (g . h) 3  == 55    ??? jak inaczej 
