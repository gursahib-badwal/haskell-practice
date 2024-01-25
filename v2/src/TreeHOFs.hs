module TreeHOFs
    ( Tree(..),
      treeMap,
      treeFold,
      treeHeight,
      treeSum,
      treeSizer
    ) where

data Tree a =
    Leaf
  | Node (Tree a,a,Tree a)
  deriving (Eq,Show)

{-
  First you should implement tree map. Tree map takes a tree, and updates all
  the values at the internal nodes according to the provided function. The
  structure of the tree should not change, but simply the values contained
  within the tree.
-}
treeMap :: (a -> b) -> Tree a -> Tree b
-- treeMap = error "Unimplemented"
treeMap f Leaf = Leaf 
treeMap f (Node (left_branch, value, right_branch)) = Node (treeMap f left_branch, f value, treeMap f right_branch)

{-
  Next, we want to be able to fold our trees. treeFold is the tree analogue's
  of List's foldr. In particular, when we hit leaves, we return the provided
  initial "b". On nodes, we fold the subtrees, and use the provided higher-
  order function to fold the values computed by those trees with the value at
  the node.
-}
treeFold :: (b -> a -> b -> b) -> b -> Tree a -> b
-- treeFold = error "Unimplemented"
treeFold f b Leaf = b
treeFold f b (Node (left_branch, value, right_branch)) = f left_branch_fold value right_branch_fold
                                                         where 
                                                          left_branch_fold = treeFold f b left_branch
                                                          right_branch_fold = treeFold f b right_branch

{-
  Now we would like to find the height of the tree. Could you find a way to do
  this with a higher-order function?
-}
treeHeight :: Tree a -> Int
-- treeHeight = error "Unimplemented"
treeHeight tree = treeFold (calculate_depth) 0 tree
                  where
                    calculate_depth :: Int -> a -> Int -> Int
                    calculate_depth left_br_height _ right_br_height = 1 + max left_br_height right_br_height

{-
  Next we would like to find the total sum of all the values in a tree of
  integers. Could you find a way to do this using a higher-order function?
-}
treeSum :: Tree Int -> Int
-- treeSum = error "Unimplemented"
treeSum tree = treeFold (sum_values) 0 tree
               where 
                sum_values :: Int -> Int -> Int -> Int  
                sum_values left_br_sum value right_br_sum= left_br_sum + value + right_br_sum

{-
  Finally, we would like to turn the trees into a "sized tree." On the nodes of
  the sized tree are pairs of initial values and sizes of the trees. This one
  is trickier, but still possible to do with a fold. Hint: you may need to use
  a higher order function that returns a pair of values, then project the
  relevant portion of the pair. In a way, this is analogous to strengthening an
  inductive hypothesis.
-}
treeSizer :: Tree a -> Tree (a,Int)
treeSizer Leaf = Leaf
treeSizer tree@(Node(left_branch, value, right_branch)) = Node(treeSizer left_branch, (value, tree_size tree), treeSizer right_branch)
                                                    where 
                                                      tree_size Leaf = 0
                                                      tree_size (Node(left, _, right)) = tree_size left + tree_size right + 1








