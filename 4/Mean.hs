mean::[Double] -> Double
mean xs = sum xs / fromIntegral (length xs)

mean'::[Double] ->  Double
mean' xs = let (res, len) = foldl (\(m, n) x -> (m + x / len, n+1)) (0, 0) xs in res
