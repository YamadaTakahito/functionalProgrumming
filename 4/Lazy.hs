module Laxy where
nats::[Integer]
nats = 0 : map (+1) nats

data X = X1 Int
 | X2 !Int
 deriving Show

x1 = X1 (1 + 1)
x2 = X2 (1 + 1)

newtype Y = Y Int deriving Show

ignore1 x = ()
ignore2 !x = ()
ignore3 x = let !a = x in ()
ignore4 x = () where !a = x

