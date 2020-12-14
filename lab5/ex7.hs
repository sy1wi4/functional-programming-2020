-- Funktory aplikatywne 1: operatory pure, (<*>), (*>) i (<*)
-- Funktory aplikatywne 2: dołączanie typów użytkownika do klasy Applicative

newtype Box a = MkBox a deriving Show

instance Applicative Box where
  pure = MkBox
  (MkBox f) <*> w = fmap f w

instance Functor Box where
  fmap f (MkBox x) = MkBox (f x)
