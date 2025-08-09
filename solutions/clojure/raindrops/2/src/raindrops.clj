(ns raindrops)

(defn convert
  "Converts a number to its corresponding string of raindrop sounds."
  [num]
  (let [vec (cond-> []
              (zero? (mod num 3)) (conj "Pling")
              (zero? (mod num 5)) (conj "Plang")
              (zero? (mod num 7)) (conj "Plong"))]
    (if (empty? vec)
      (str num)
      (apply str vec))))
