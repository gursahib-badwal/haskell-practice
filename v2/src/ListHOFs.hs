{-# LANGUAGE NoImplicitPrelude #-}

module ListHOFs
    ( zip,
      alternatingMap,
      sumEvens,
      flatten
    ) where

import Prelude(Int(..),Maybe(..),filter,mod,(+),(.),(==),(++))
import GHC.Base

{-
  One useful thing to do with lists is zip them together. Let's build the zip
  function, that does exactly this. However, lists don't always have the same
  length, so when they have differing lengths, we should return Nothing. If
  they have the same length, we should return Just l, where l is the zipped
  list.
-}
zip :: [a] -> [b] -> Maybe [(a,b)]
-- zip = error "Unimplemented"
zip [] [] = Just []
zip _ [] = Nothing --if one of the list empty, so the recrusive call to the zip function will return Nothing
zip [] _ = Nothing --so these two patterns are responsible for checking if the lengths of the two lists were different
zip (x:xs) (y:ys) = case zip xs ys of
    Just result -> Just ((x, y) : result)
    _ -> Nothing

{-
  You've seen map before, so it's time to try building an "alternating map". An
  alternating map does the same thing that a map does, but it alternates which
  function is used at a time. The first function used should be the first
  function, then the second element should have the second function applied,
  and so on.
-}
alternatingMap :: (a -> b) -> (a -> b) -> [a] -> [b]
-- alternatingMap = error "Unimplemented"
alternatingMap f1 f2 [] = []
alternatingMap f1 f2 (h:t) = f1 h : alternatingMap f2 f1 t
--switching the first and second functions continously during every recursive call
-- causes only the function in the first argument of the function call to be applied on the current element


{-
  Now you should sum the even elements of a list up. Can you do this by 
  combining two other functions together. Notice what you've been provided in
  your imports.
-}
sumEvens :: [Int] -> Int
-- sumEvens = error "Unimplemented"
sumEvens list = foldr (+) 0 (filter (\x -> x `mod` 2 == 0) list)

{-
  The last function is the flatten a list of lists into a single list. This
  can be done by just finding the correct applications for the right higher-
  order function.
-}
flatten :: [[a]] -> [a]
-- flatten = error "Unimplemented"
flatten [[]] = []
flatten list = foldr (++) [] list
