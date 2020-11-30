-- Klasy typów i ich instancje 1: dołączanie typu do istniejącej klasy

-- data MyInt = MkMyInt Int
newtype MyInt = MkMyInt Int

instance Eq MyInt where
  (==) (MkMyInt i1) (MkMyInt i2) = i1 == i2

instance Ord MyInt where
  (<=) (MkMyInt i1) (MkMyInt i2) = i1 <= i2


instance Num MyInt where
  (+) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 + i2)
  (-) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 - i2)
  (*) (MkMyInt i1) (MkMyInt i2) = MkMyInt (i1 * i2)
  negate (MkMyInt i)            = MkMyInt (negate i)
  abs (MkMyInt i)               = MkMyInt (abs i)
  signum (MkMyInt i)            = MkMyInt (signum i)
  fromInteger int               = MkMyInt (fromIntegral int)


instance Show MyInt where
  show (MkMyInt i) = "MkMyInt " ++ show i

-- data BinTree a = EmptyBT |
--                  NodeBT a (BinTree a) (BinTree a)

instance Eq a => Eq (BinTree a) where
    (==) EmptyBT EmptyBT = True
    (==) EmptyBT _ = False
    (==) _ EmptyBT = False
    (==) (NodeBT root lt rt) (NodeBT root2 lt2 rt2) = (root == root2 && lt == lt2 && rt == rt2)
