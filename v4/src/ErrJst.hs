module ErrJst(ErrJst(..)) where

data ErrJst e a = 
     Err e
   | Jst a
   deriving (Eq,Show)

instance Functor (ErrJst e) where
   -- fmap = error "Unimplemented"
   fmap func (Err e) = Err e
   fmap func (Jst a) = Jst (func a) 


instance Applicative (ErrJst e) where
   -- pure = error "Unimplemented"
   pure = Jst 
   -- (<*>) = error "Unimplemented"
   Jst function <*> Jst value = Jst (function value)
   Err function_err <*> Err value_err = Err function_err
   Err function_err <*> _ = Err function_err
   _ <*> Err value_err = Err value_err
 