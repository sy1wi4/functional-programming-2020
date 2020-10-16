-- guards

absInt :: Int -> Int
absInt n | n >= 0 = n
         | otherwise = -n



sgn :: Int -> Int
sgn x | x > 0 = 1
      | x < 0 = -1
      | otherwise = 0



min3Int :: (Int, Int, Int) -> Int
min3Int (a, b, c) | (a < b) && (a < c) = a
                  | (b < c) && (b < a) = b
                  | otherwise = c
