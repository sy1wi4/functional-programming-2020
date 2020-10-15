sqr :: Double -> Double
sqr x = x * x


vec2DLen :: (Double, Double) -> Double
vec2DLen (x, y) = sqrt (x^2 + y^2)


-- oblicza długość wektora w 3D
vec3DLen :: (Double, Double,Double) -> Double
vec3DLen (x, y, z) = sqrt (x^2 + y^2 + z^2)


-- zamienia wartości zmiennych
swap :: (Int, Char) -> (Char, Int)
swap (num, a) = (a, num)


-- sprawdza, czy przekazane trzy liczby całkowite są równe
threeEqual :: (Int, Int, Int) -> Bool
threeEqual (x, y, z) = (x == y) && (y == z)


-- oblicza pole trójkąta, jeśli znane są długości a, b i c jego boków (wzór Herona)
area :: (Double, Double, Double) -> Double
area (a, b, c) = sqrt(((a + b + c)/2*((a + b + c)/2 - a)*((a + b + c)/2 - b)*((a + b + c)/2-c)))
