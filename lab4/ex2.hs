-- Algebraiczne typy danych 1: product & sum types, record syntax

-- product: AB
--sum: A or B (A | B)


-- product type example (one constructor)
data CartInt2DVec = MkCartInt2DVec Int Int -- konwencja: prefix 'Mk' dla konstruktora
-- para liczb typu Int


xCoord :: CartInt2DVec -> Int
xCoord (MkCartInt2DVec x _) = x

yCoord :: CartInt2DVec -> Int
yCoord (MkCartInt2DVec _ y) = y



data Cart2DVec' a = MkCart2DVec' a a

xCoord' :: Cart2DVec' a -> a
xCoord' (MkCart2DVec' x _) = x

yCoord' :: Cart2DVec' a -> a
yCoord' (MkCart2DVec' _ y) = y


-- record syntax
data Cart2DVec'' a = MkCart2DVec'' {x::a, y::a}

-- xCoord'' :: Cart2DVec'' a -> a
-- xCoord'' (MkCart2DVec'' {x = xVal, y = _}) = xVal

-- yCoord'' :: Cart2DVec'' a -> a
-- yCoord'' (MkCart2DVec'' {y = yVal, x = _}) = yVal -- uwaga na kolejność x,y



-- sum type example (two constructors)
data List a = EmptyL | Cons a (List a) deriving Show

head' :: List a -> a
head' EmptyL      = error "head': the empty list has no head!"
head' (Cons x xs) = x



-- enum type example (special case of sum type)
data ThreeColors = Blue |
                   White |
                   Red

type ActorName = String

leadingActor :: ThreeColors -> ActorName
leadingActor Blue  = "Juliette Binoche"
leadingActor White = "Zbigniew Zamachowski"
leadingActor Red   = "Irene Jacob"



-- 1. Zdefiniować funkcje dostępowe np. xCoord3D itd. dla następującego 
-- typu (reprezentacja wektorów w 3D, współrzędne kartezjańskie)

{-
uwaga: ta sama nazwa* dla:
 - konstruktora typu (po lewej)
 - konstruktora danych/wartości (po prawej)

 * druga (obok omówionej poprzednio -- z prefiksem 'Mk') powszechna konwencja w Haskellu!
-}

data Cart3DVec a = Cart3DVec a a a

xCoord3D (Cart3DVec x _ _) = x

yCoord3D (Cart3DVec _ y _) = y

zCoord3D (Cart3DVec _ _ z) = z

-- np. xCoord3D (Cart3DVec 4 2 5) = 4


-- 2. Wykorzystując record syntax napisać nową wersję Cart3DVec, a następnie
-- sprawdzić istnienie odpowiednich (wygenerowanych przez kompilator) funkcji dostępowych

data Cart3DVec' a = Cart3DVec' {x'::a, y'::a, z'::a}

xCoord3D' (Cart3DVec' {x' = xVal, y' = _, z' = _}) = xVal

yCoord3D' (Cart3DVec' {y' = yVal, x' = _, z' = _}) = yVal

zCoord3D' (Cart3DVec' {z' = zVal, x' = _, y' = _}) = zVal

-- np. zCoord3D' (Cart3DVec' {x' = 2, y' = 5, z' = -8}) = -8

-- nie trzeba deklarować funckji, komplilator wie, że np.
-- z' (Cart3DVec' {x' = 2, y' = 5, z' = -8}) = -8



-- 6. Zdefiniować funkcję obliczającą pole powierzchni (figury płaskiej)
data Shape = Circle Float |
             Rectangle Float Float

area :: Shape -> Float
area (Circle r) = pi*r^2
area (Rectangle a b) = a*b

-- np. area (Rectangle 6 5) = 30.0


-- 8. Zdefiniować typ wyliczeniowy TrafficLights dla sygnalizacji świetlnej oraz funkcję
-- podającą, co powinien robić kierowca, widząc dane światło

-- enum type
data TrafficLights  = Red |
                      Orange |
                      Green 


actionFor :: TrafficLights -> String
actionFor Red = "Stop!"
actionFor Orange = "Light is about to change!"
actionFor Green = "Go!"
