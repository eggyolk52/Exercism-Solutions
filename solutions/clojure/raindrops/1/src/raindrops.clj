(ns raindrops)

(defn convert
  "Converts a number to its corresponding string of raindrop sounds."
  [num]
  (let [result (as-> "" $
                 (if (= 0 (mod num 3)) (str $ "Pling") $)
                 (if (= 0 (mod num 5)) (str $ "Plang") $)
                 (if (= 0 (mod num 7)) (str $ "Plong") $))]

    (if (= result "")
      (str num)
      result)))
