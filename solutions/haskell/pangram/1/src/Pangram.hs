module Pangram (isPangram) where
-- import Distribution.Simple.Utils (xargs)
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text
    | 26 == length [x | x <- ['a'..'z'], x `elem` lowertext] = True
    | otherwise = False
    where lowertext = map toLower text