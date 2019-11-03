digits::Int -> Int
digits = length . show

square::Num a=>a->a
square = (^ 2)

ultimate::Int -> String
ultimate 42 = "人生、宇宙、全てのこたて"
ultimate n = show n

maybeToList::Maybe a -> [a]
maybeToList Nothing = []
maybeToList(Just a) = [a]

listToMaybe::[a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (a : as) = Just a

deeping::String -> String
deeping(' ':' ': xs) = "    " ++ xs
deeping(' ':xs) = "  " ++ xs
deeping xs = xs

nonExhaustive:: Int->Int
nonExhaustive 0 = 0
nonExhaustive 1 = 1
nonExhaustive 2 = 2

deeping'::String -> String
deeping' s@(' ':' ':_) = "  " ++ s
deeping' s@(' ':_) = " " ++ s
deeping' s = s

safeSqrt::(Ord a, Floating a) => a -> Maybe a
safeSqrt x
 | x < 0 = Nothing
 | otherwise = Just (sqrt x)

caseOfFirstLetter::String -> String 
caseOfFirstLetter "" = "empty"
caseOfFirstLetter (x: xs)
 | 'a' <= x && x <= 'z' = "lower"
 | 'A' <= x && x <= 'Z' = "upper"
 | otherwise = "other"

caseOfFirstLetter' :: String -> String 
caseOfFirstLetter' str =
 case str of
  "" -> "empty"
  (x:xs) -> if 'a' <= x && x <= 'z'
            then "lower"
            else if 'A' <= x && x <= 'Z'
            then "upper"
            else
                "other"
