module Bob (responseFor) where
-- import Distribution.Simple.Utils (xargs)
import Data.Char (isSpace)

responseFor :: String -> String
responseFor xs
    | null str = "Fine. Be that way!"
    | isQuestion && isYell = "Calm down, I know what I'm doing!"
    | isQuestion = "Sure."
    | isYell = "Whoa, chill out!"
    | otherwise = "Whatever."
    where str = filter (not . isSpace) xs
          isQuestion = last str == '?'
          isYell = hasUpper && not hasLower
              where hasUpper = any (`elem` ['A'..'Z']) str
                    hasLower = any (`elem` ['a'..'z']) str
