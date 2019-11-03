digits::Int -> Int
digits = length . show

square::Num a => a -> a
square = (^ 2)

square'::Num a => a -> a
square' x = x ^ 2

ultimate::Int -> String
ultimate 42 = "人生、宇宙、すべての答え"
ultimate n = show n

maybeToList'::Maybe a -> [a]
maybeToList' Nothing = []
maybeToList' (Just a) = [a]

listToMaybe'::[a] -> Maybe a
listToMaybe' [] = Nothing
listToMaybe' (a : as) = Just a

deeping::String -> String
deeping (' ': ' ': xs) = "    " ++ xs
deeping (' ': xs) = "  " ++ xs
deepgin xs = xs

nonExhaustive::Int -> Int
nonExhaustive 0 = 0
nonExhaustive 1 = 1
nonExhaustive 2 = 2

deeping'::String -> String
deeping' s@(' ': ' ': _) = "    " ++ s
deeping' s@(' ': _) = "  " ++ s
deepgin' s = s

safeSqrt::(Ord a, Floating a) => a -> Maybe a
safeSqrt x
 | x < 0 = Nothing
 | otherwise = Just (sqrt x)
