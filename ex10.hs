-- wyrażenie let...in

roots :: (Double, Double, Double) -> (Double, Double)
roots (a, b, c) =
 let d = sqrt (b * b - 4 * a * c)
     e = 2 * a
 in ( (-b - d) / e, (-b + d) / e )



unitVec2D :: (Double, Double) -> (Double, Double)
unitVec2D (a, b) = 
    let d = sqrt (a^2 + b^2) 
    in (a/d, b/d)   



unitVec3D :: (Double, Double, Double) -> (Double, Double, Double)
unitVec3D (a, b, c) =  
    let d = sqrt (a^2 + b^2 + c^2)
    in (a/d, b/d, c/d)



area :: (Double, Double, Double) -> Double
area (a, b, c) = 
    let p = (a + b + c)/2
    in sqrt (p*(p-a)*(p-b)*(p-c))
