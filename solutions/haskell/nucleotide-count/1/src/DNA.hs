module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList)
import Data.List (sort, group)
import Control.Arrow (ArrowChoice(left))

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

-- nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = 
    if "ACGT" == map fst count
        then Right $ fromList count
        else Left "error"
    where count = map (\x -> (head x, length x)) $ group $ sort xs