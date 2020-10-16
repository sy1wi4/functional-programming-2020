-- klauzula where

roots :: (Double, Double, Double) -> (Double, Double)
roots (a, b, c) = ( (-b - d) / e, (-b + d) / e )
   where d = sqrt (b * b - 4 * a * c)
         e = 2 * a



-- oblicza wersor (wektor jednostkowy) podanego jako argument wektora 2D
unitVec2D :: (Double, Double) -> (Double, Double)
unitVec2D (a, b) = (a/d, b/d)
    where d = sqrt (a^2 + b^2)     -- długość wektora



-- oblicza wersor (wektor jednostkowy) podanego jako argument wektora 3D
unitVec3D :: (Double, Double, Double) -> (Double, Double, Double)
unitVec3D (a, b, c) = (a/d, b/d, c/d) 
    where d = sqrt (a^2 + b^2 + c^2)



-- oblicza pole trójkąta na podstawie wzoru Herona
area :: (Double, Double, Double) -> Double
area (a, b, c) = sqrt (p*(p-a)*(p-b)*(p-c))
    where p = (a + b + c)/2
