-- Definicja funkcji: currying, partially applied functions

-- "Currying" to sposób transformacji funkcji przyjmującej wiele argumentów 
-- do funkcji przyjmującej jeden argument.



-- nazwy zmiennych z małych liter (wielkie dla typów)
myFun x = 2 * x


add2T :: Num a => (a, a) -> a
add2T (x,y) = x + y


-- przyjmuje parametr a , zwraca funcję a -> a
-- równoznaczne z (add2C x) y
add2C :: Num a => a -> (a -> a)
add2C x y = x + y

-- -> jest łączny prawostronnie
-- w prawostronnej łączności dopuszcza się uproszczenie a*(b*c) = a*b*c (* - działanie)

-- f x y jest równoznaczne z (f x) y


add3T :: Num a => (a, a, a) -> a
add3T (x, y, z) = x + y + z


add3C :: Num a => a -> (a -> a -> a)
add3C x y z = x + y + z



curry2 :: ((a, b) -> c) -> a -> b -> c
curry2 f x y = f (x, y)
-- (curry2 f) x y = f (x, y)
-- pierwszy argument funckji curry2 jest funkcją akceptującą parę, 
-- wywołuje tę funkcję dla 2 kolejnych argumentów - x oraz y


uncurry2 :: (a -> b -> c) -> (a, b) -> c
uncurry2 f (x, y) = f x y

-- dostaje funkcję akceptującą 2 argumenty oraz parę, 
-- wywołuje tę funckję dla elementów pary


curry3 :: ((a, b, c) -> d) -> a -> b -> c -> d
curry3 f x y z = f (x, y, z)


uncurry3 :: (a -> b -> c -> d) -> (a, b, c) -> d
uncurry3 f (x, y, z) = f x y z
