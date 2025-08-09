module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = (seconds / 60 / 60 / 24 / (365.25 * x planet)) `trunc` 2
    where x Mercury = 0.2408467 
          x Venus   = 0.61519726
          x Earth   = 1.0       
          x Mars    = 1.8808158 
          x Jupiter = 11.862615 
          x Saturn  = 29.447498 
          x Uranus  = 84.016846 
          x Neptune = 164.79132 

trunc :: Float -> Int -> Float
trunc x n = fromIntegral (round (x * t)) / t
    where t = 10^n