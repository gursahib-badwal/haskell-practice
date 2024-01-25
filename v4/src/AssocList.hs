module AssocList(AssocList(..),doubleMap) where

data AssocList k a = 
     Nil
   | Cons(k,a,AssocList k a)
   deriving (Eq,Show)

instance Functor (AssocList k) where
   -- fmap = error "Unimplemented"
      fmap func Nil = Nil
      fmap func (Cons(k, a, tail)) = Cons(k, func a, fmap func tail)

doubleMap :: (k -> a -> (k',a')) -> AssocList k a -> AssocList k' a'
-- doubleMap = error "Unimplemented"
doubleMap func Nil = Nil
doubleMap func (Cons(k, a, tail)) = Cons(fst $ func k a, snd $ func k a, doubleMap func tail) 