-- Algebraiczne typy danych 2: rekursja strukturalna

import Data.List


data BinIntTree = EmptyIntBT |
                  IntNodeBT Int BinIntTree BinIntTree

sumBinIntTree :: BinIntTree -> Int
sumBinIntTree EmptyIntBT = 0
sumBinIntTree (IntNodeBT n lt rt) = n + sumBinIntTree lt + sumBinIntTree rt

-- np. sumBinIntTree $ IntNodeBT 1 (IntNodeBT 2 EmptyIntBT EmptyIntBT) (IntNodeBT 3 EmptyIntBT EmptyIntBT) = 6



-- uogólnienie
data BinTree a = EmptyBT |
                 NodeBT a (BinTree a) (BinTree a)

sumBinTree :: (Num a) => BinTree a -> a
sumBinTree EmptyBT = 0
sumBinTree (NodeBT n lt rt) = n + sumBinTree lt + sumBinTree rt




-- data Expr a = Lit a | -- literal/value a, e.g. Lit 2 = 2
--               Add (Expr a) (Expr a)

-- eval :: Num a => Expr a -> a
-- eval (Lit n) = n
-- eval (Add e1 e2) = eval e1 + eval e2

-- show' :: Show a => Expr a -> String
-- show' (Lit n) = show n
-- show' (Add e1 e2) = "(" ++ show' e1 ++ "+" ++ show' e2 ++ ")"




-- 1. Definicje funkcji na drzewie binarnym

-- 1.1 głębokość drzewa binarnego
depthOfBT :: BinTree a -> Int 
depthOfBT (EmptyBT) = 0
depthOfBT (NodeBT n lt rt) = 1 + max (depthOfBT lt) (depthOfBT rt)


-- 1.2 napisać trzy wersje : preorder, inorder, postorder
-- flattenBT :: BinTree a -> [a]

-- in-order (LVR)
flattenBTInOrder :: BinTree a -> [a]
flattenBTInOrder (EmptyBT) = []
flattenBTInOrder (NodeBT n lt rt) = (flattenBTInOrder lt) ++ [n] ++ (flattenBTInOrder rt)

-- pre-order (VLR)
flattenBTPreOrder :: BinTree a -> [a]
flattenBTPreOrder (EmptyBT) = []
flattenBTPreOrder (NodeBT n lt rt) = [n] ++ (flattenBTInOrder lt) ++ (flattenBTInOrder rt)

-- post-order (LRV)
flattenBTPostOrder :: BinTree a -> [a]
flattenBTPostOrder (EmptyBT) = []
flattenBTPostOrder (NodeBT n lt rt) =  (flattenBTInOrder lt) ++ (flattenBTInOrder rt) ++ [n] 


-- 1.3 funkcja map dla drzewa binarnego
mapBT :: (a -> b) -> BinTree a -> BinTree b
mapBT func EmptyBT = EmptyBT
mapBT func (NodeBT n lt rt) = NodeBT (func n) (mapBT func lt) (mapBT func rt)


-- 1.4 wstawianie elementu do drzewa binarnego
insert' :: Ord a => a -> BinTree a -> BinTree a 
insert' n EmptyBT = NodeBT n EmptyBT EmptyBT
insert' n (NodeBT root lt rt) = 
    if n <= root
    then NodeBT root (insert' n lt) rt
    else NodeBT root lt (insert' n rt)


-- 1.5 tworzenie drzewa binarnego z listy
list2BST :: Ord a => [a] -> BinTree a
list2BST l = foldr insert' EmptyBT l



-- 6. Rozszerzyć definicję typu data Expr a o operacje odejmowania 
-- i mnożenia oraz zmodyfikować odpowiednio funkcje show' i eval

data Expr a = Lit a | -- literal/value a, e.g. Lit 2 = 2
              Add (Expr a) (Expr a) |
              Subtract (Expr a) (Expr a) |
              Multiply (Expr a) (Expr a)

eval :: Num a => Expr a -> a
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Subtract e1 e2) = eval e1 - eval e2
eval (Multiply e1 e2) = eval e1 * eval e2

show' :: Show a => Expr a -> String
show' (Lit n) = show n
show' (Add e1 e2) = "(" ++ show' e1 ++ "+" ++ show' e2 ++ ")"
show' (Subtract e1 e2) = "(" ++ show' e1 ++ "-" ++ show' e2 ++ ")"
show' (Multiply e1 e2) = "(" ++ show' e1 ++ "*" ++ show' e2 ++ ")"
