data Tree a = Leaf { element :: a }
 | Fork { element::a
  ,left :: Tree a
  ,right :: Tree a
 } deriving Show

dtree::Tree Integer
dtree = dtree' 0 where
 dtree' depth = Fork { element = depth
  ,left = dtree'(depth + 1)
  ,right = dtree' (depth + 1)
 }
