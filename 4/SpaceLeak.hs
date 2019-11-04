total::Num a => [a] -> a
total xs = total' 0 xs where
  total' acc [] = acc
  total' acc (x:xs) = total' (acc + x) xs
