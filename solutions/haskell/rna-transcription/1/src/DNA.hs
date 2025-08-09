module DNA (toRNA) where
import Distribution.Simple.Utils (xargs)

toRNA :: String -> Either Char String
toRNA xs = if test xs == ' '
             then Right [ translate x | x <- xs ]
             else Left $ head $ dropWhile (`elem` dna) xs
             where dna = ['G', 'C', 'T', 'A']

test :: String -> Char
test [] = ' '
test (x:xs)
    | x `elem` dna = test xs
    | otherwise = x
    where dna = ['G', 'C', 'T', 'A']

translate :: Char -> Char
translate x
    | x == 'G' = 'C'
    | x == 'C' = 'G'
    | x == 'T' = 'A'
    | x == 'A' = 'U'
    | otherwise = ' '