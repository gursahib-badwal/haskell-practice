module ZipTree(Tree(..)) where

data Tree a =
      Leaf
    | Node(Tree a,a,Tree a)
   deriving (Eq,Show)

instance Functor Tree where
   fmap f Leaf          = Leaf
   fmap f (Node(l,v,r)) = Node(fmap f l,f v,fmap f r)

instance Applicative Tree where
    pure x = Node(pure x,x,pure x)
   --  (<*>) = error "Unimplemented"
    Node (func_tree_l, function, func_tree_r) <*> Node (arg_tree_l, argument, arg_tree_r) = Node (func_tree_l <*> arg_tree_l, function argument, func_tree_r <*> arg_tree_r)
    _ <*> _ = Leaf 