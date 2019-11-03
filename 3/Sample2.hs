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

caseOfFirstLetter::String -> String
-- partern match
caseOfFirstLetter "" = "empty"
-- guard
caseOfFirstLetter(x:xs)
| 'a' <= x && x <= 'z' = "lower"
| 'A' <= x && x <= 'Z' = "upper"
| otherwise = "other"

caseOfFirstLetter'::String -> String
caseOfFirstLetter' str = 
case str of
"" -> "empty"
(x:xs) -> if 'a' <= x && x <= 'z'
then "lower"
else if 'A' <= x && x <= 'Z'
then "upper"
else "other"

caseOfFirstLetter''::String -> String
caseOfFirstLetter'' "" = "empty"
caseOfFirstLetter''(x:xs)
| inRange 'a' 'z' = "lowwer"
| inRange 'A' 'Z' = "upper"
| otherwise = "other"
where
inRange lower upper = lower <= x && x <= upper


length'::[a] -> Int
length' [] = 0
length'(x:xs) = 1 + length' xs

take'::Int -> [a] -> [a]
take' n _ | n <= 0 = [] -- guard
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

drop':: Int -> [a] -> [a]
drop' n xs | n <= 0 = xs
drop' _ [] = []
drop' n (_:xs) = drop' (n-1) xs 

-- sort
ins::Ord a => a -> [a] -> [a]
ins e [] = [e]
ins e (x:xs)
| e < x = e : x : xs
| otherwise = x : ins e xs

insSort::Ord a => [a] -> [a]
insSort [] = []
insSort (x:xs) = ins x (insSort xs)

each::(a -> b) -> (c -> d) -> (a, c) -> (b, d)
each f g (x, y) = (f x, g y)

filter'::(a->Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs)
| p x = x : filter' p xs
| otherwise = filter' p xs

map':: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f [] _ = []
zipWith' f _ [] = []
zipWith' f (x:xs) (y:ys) = f x  y : f xs ys
