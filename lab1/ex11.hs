-- Formatowanie kodu: off-side rule


roots :: (Double, Double, Double) -> (Double, Double)
roots (a, b, c) = ( (-b - d) / e, (-b + d) / e )
   where { 
        d = sqrt (b * b - 4 * a * c);
       e = 2 * a ; 
       }
-- {} definiują granice bloku



-- komentarz jednoliniowy

{-
komentarz
wieloliniowy
-}



roots2 :: (Double, Double, Double) -> (Double, Double)
roots2 (a, b, c) =
 let {
     d = sqrt (b * b - 4 * a * c);
        e = 2 * a;
 }
 in ( (-b - d) / e, (-b + d) / e )
