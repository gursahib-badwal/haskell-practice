module SwitchableStack
    ( State,
      empty,
      push,
      pop,
      setInactive,
      setActive,
      mapState,
      popWhere
    ) where

import Data.List (elem,nub)

newtype State a = State (Bool, [a]) deriving (Show)

{- This should create an empty state of your stack. 
   By default, your stack should be active. -}
empty :: State a
-- empty = error "Unimplemented"
empty = State (True, [])

{- This should push a new element onto your stack.
   In this stack, you cannot have two of the element on the stack.
   If the element already exists on the stack, do not edit the state. -}
push :: (Eq a) => State a -> a -> State a
-- push = error "Unimplemented"
push (State (status, stack)) element
   | element `elem` stack = State (status, stack)
   | otherwise = State (status, element:stack)

{- This should pop the most recently added element off the stack.
   If there are no elements on the stack, return Nothing and an
   unedited version of the stack.
   If the stack is not active, return Nothing and an unedited version
   of the stack. -}
pop :: State a -> (Maybe a,State a)
-- pop = error "Unimplemented"
pop (State (False, stack)) = (Nothing, (State (False, stack)))
pop (State (True, [])) = (Nothing, (State (True, [])))
pop (State (True, h:t)) = (Just h, State (True, t))

{- This should switch the stack to the "inactive" state.
When a stack is inactive, elements can be pushed on it, but they
cannot be popped off it. -}
setInactive :: State a -> State a
-- setInactive = error "Unimplemented"
setInactive (State (False, stack)) = (State (False, stack))
setInactive (State (True, stack)) = (State (False, stack))

{- This should switch the stack to the "active" state.
When a stack is active, elements can be pushed on it, and they
can be popped off it. -}
setActive :: State a -> State a
-- setActive = error "Unimplemented"
setActive (State (True, stack)) = (State (True, stack))
setActive (State (False, stack)) = (State (True, stack))

{- This edits elements on the stack according to the provided function.
   However, this edit may cause duplicates to be added. After mapping the state,
   be sure to remove duplicate elements. -}
mapState :: (Eq b) => (a -> b) -> State a -> State b
-- mapState = error "Unimplemented"
mapState func (State (status, stack)) = (State (status, nub . map func $ stack ))



{- This pops all elements that satisfy a given predicate off the stack.
   The remaining elements on the stack are those that do not satisfy
   the provided predicate, in the original order.
   Do not pop any elements from the stack if the stack is inactive. -}
popWhere :: (a -> Bool) -> State a -> ([a],State a)
-- popWhere = error "Unimplemented"
popWhere predicate (State (False, stack)) = ([], (State (False, stack)))
popWhere predicate (State (True, stack)) = ((fst (helper_partition predicate stack), State (True, snd (helper_partition predicate stack))))
   where
      helper_partition :: (a -> Bool) -> [a] -> ([a],[a])
      helper_partition pred list = ([x| x <- list, pred x], [x| x <- list, not $ pred x])
