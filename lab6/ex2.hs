-- Przykłady monad: Maybe

-- bind: >>= 

-----------------------------------------------
half x = if even x
        then Just (x `div` 2)
        else Nothing

-- half 4 zwróci Just 2
-- half 3 zwróci Nothing

-- Just 4 >>= half zwróci Just 2

-- >>= bierze monadę (np. Just 3), 
-- funkcję, która zwraca monadę (np. half)
-- i zwraca monadę
-- więc Maybe jest monadą:

-- instance Monad Maybe where
--     Nothing >>= func = Nothing
--     Just val >>= func  = func val

-- Wywołania można też połączyć w łańcuch:
-- Just 20 >>= half >>= half zwróci Just 5
-- Just 20 >>= half >>= half >>= half zwróci Nothing
------------------------------------------------

-- import Control.Monad


insertMaybe :: a -> Maybe a
insertMaybe = Just


safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (x:xs) = Just xs


doSafeTail3x :: [a] -> Maybe [a]
doSafeTail3x xs = do
  t1 <- safeTail xs
  t2 <- safeTail t1
  t3 <- safeTail t2
  return t3

safeTail3x :: [a] -> Maybe [a]
safeTail3x xs =
  safeTail xs >>= \t1 ->
    safeTail t1 >>= \t2 ->
      safeTail t2 >>= \t3 ->
        return t3

safeTail3x' :: [a] -> Maybe [a]
safeTail3x' xs = return xs >>= safeTail >>= safeTail >>= safeTail


-- zdecydowanie ostatnia jest najczytelniejsza ;)


f5 :: Int -> Int -> Int -> Int
f5 x y z = 1000 `div` x + 100 `div` y + 10 `div` z


safeDiv x y | y /= 0    = Just $ x `div` y
            | otherwise = Nothing

safeF5 :: Int -> Int -> Int -> Maybe Int
safeF5 x y z =
  case (safeDiv 1000 x) of
    Nothing -> Nothing
    Just (iOverX) ->
      case (safeDiv 100 y) of
        Nothing -> Nothing
        Just (iOverY) ->
          case (safeDiv 10 z) of
            Nothing -> Nothing
            Just (iOverZ) -> Just $ iOverX + iOverY + iOverZ


safeF5' :: Int -> Int -> Int -> Maybe Int
safeF5' x y z = do
  iOverX <- safeDiv 1000 x
  iOverY <- safeDiv 100 y
  iOverZ <- safeDiv 10 z
  return $ iOverX + iOverY + iOverZ



-- ZADANIA

-- 1.
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b 
-- (>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
f >=> g = \x -> f x >>= g


-- 3. 
joinMaybe :: Monad m => m (m a) -> m a
joinMaybe x = x >>= id
-- join (Just (Just 5)) zwraca Just 5
