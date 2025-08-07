module CollatzConjecture (collatz) where
import System.Posix (stdFileMode)

collatz :: Integer -> Maybe Integer
collatz 1 = Just 0
collatz n
  | n > 1 = Just $ fromIntegral $ length (collatzList n)
  | otherwise = Nothing

collatzList :: Integer -> [Integer]
collatzList 1 = []
collatzList n
  | even n    = n : collatzList (n `div` 2)
  | otherwise = n : collatzList (n*3 + 1)