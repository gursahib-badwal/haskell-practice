module WarningAccumulatorMonad(WarningAccumulator(..),getResult,getWarnings) where

newtype WarningAccumulator w a = WarningAccumulator (a,[w])
   deriving (Show,Eq)

getResult :: WarningAccumulator w a -> a
getResult (WarningAccumulator (x,ws)) = x

getWarnings :: WarningAccumulator w a -> [w]
getWarnings (WarningAccumulator (x,ws)) = ws

instance Functor (WarningAccumulator w) where
   -- fmap = error "Unimplemented"
   fmap func (WarningAccumulator (val, list)) = WarningAccumulator (func val, list) 

instance Applicative (WarningAccumulator w) where
   -- pure = error "Unimplemented"
   pure val = WarningAccumulator (val, [])

   -- (<*>) = error "Unimplemented"
   WarningAccumulator (func, left_warnings) <*> WarningAccumulator (val, right_warnings) = WarningAccumulator (func val, left_warnings ++ right_warnings)


instance Monad (WarningAccumulator w) where
   return = pure
   -- -- (>>=) = error "Unimplemented"
   (WarningAccumulator (val, list)) >>= func =
      let WarningAccumulator (new_val, new_list) = func val
      in (WarningAccumulator (new_val, list ++ new_list))
      
