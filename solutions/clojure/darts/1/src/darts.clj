(ns darts)

(defn score
  "Calculates the score of a dart throw."
  [x y]
  (let [distance (Math/sqrt (+ (* x x) (* y y)))]
    (cond
      (<= distance 1) 10
      (<= distance 5) 5
      (<= distance 10) 1
      :else 0)))
