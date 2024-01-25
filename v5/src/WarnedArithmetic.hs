module WarnedArithmetic(Warning(..),Expr(..),evaluate) where

import WarningAccumulatorMonad

data Warning = DivByZero | AddByNaN
   deriving (Show,Eq)

{- Hint: If the second input is x2, check if x2 == 0.0 -}
warningDivide :: Float -> Float -> WarningAccumulator Warning Float
-- warningDivide = error "Unimplemented"
warningDivide x1 x2
    | x2 == 0.0 = WarningAccumulator (div, [DivByZero])
    | otherwise = WarningAccumulator (div, [])
 where 
    div = x1/x2

{- Hint: use the isNaN function -}
warningPlus :: Float -> Float -> WarningAccumulator Warning Float
-- warningPlus = error "Unimplemented"
warningPlus x1 x2
    | isNaN x1 || isNaN x2 = WarningAccumulator (sum, [AddByNaN])
    | otherwise = WarningAccumulator (sum, [])
 where 
    sum = x1 + x2

data Expr =
     Base Float
   | Divide (Expr,Expr)
   | Plus (Expr,Expr)
   deriving (Show,Eq)

evaluateHelper :: Expr -> WarningAccumulator Warning Float
-- evaluateHelper = error "Unimplemented"
evaluateHelper (Base val) = return val

evaluateHelper (Divide (first_exp, second_exp)) = do
    first_val <- evaluateHelper first_exp
    second_val <- evaluateHelper second_exp
    warningDivide first_val second_val

evaluateHelper (Plus (first_exp, second_exp)) = do
    first_val <- evaluateHelper first_exp
    second_val <- evaluateHelper second_exp
    warningPlus first_val second_val

evaluate :: Expr -> (Float,[Warning])
evaluate e =
   let res = evaluateHelper e in
   (getResult res, getWarnings res)
   