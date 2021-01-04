-- Składanie i "aplikacja" funkcji: funkcje postaci: a→b vs. a→m b
-- (rozszerzone/monadyczne, Kleisli arrows)

(<$<) :: (a -> b) -> a -> b
(<$<) = ($)

(>$>) :: a -> (a -> b) -> b
x >$> f = f x
infixl 0 >$>



(<.<) :: (b -> c) -> (a -> b) -> (a -> c)
(<.<) = (.)

(>.>) :: (a -> b) -> (b -> c) -> (a -> c)
f >.> g = g . f
infixl 9 >.>



safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (x:xs) = Just xs



extractMaybe :: Maybe a -> a
extractMaybe Nothing  = error "Nothing inside!"
extractMaybe (Just x) = x



insertMaybe :: a -> Maybe a
insertMaybe = Just



(>^$>) :: Maybe a -> (a -> Maybe b) -> Maybe b
Nothing  >^$> _ = Nothing
(Just x) >^$> f = f x
infixl 1 >^$>



f1 :: (Ord a, Num a) => a -> Maybe a
f1 x = if x > 0 then Just (x + 1) else Nothing

f2 :: (Eq a, Num a) => a -> Maybe a
f2 x = if x /= 0 then Just (10 * x) else Nothing

-- Kleisli composition
(>.>>) :: (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)
f >.>> g = \x -> g (extractMaybe (f x))




-- ZADANIE
-- Zmodyfikować definicję:
-- f >.>> g = \x -> g (extractMaybe (f x))
-- tak, aby zamiast extractMaybe wykorzystać >^$>

f >.>> g = \x -> (f x) >^$> g 
