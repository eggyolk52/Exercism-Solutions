(ns game-of-life)

(defn get-neighbors [cells x y]
  (map #(get-in cells [(+ y (first %)) (+ x (second %))])
       [[-1 -1] [-1  0] [-1  1]
        [ 0 -1]         [ 0  1]
        [ 1 -1] [ 1  0] [ 1  1]]))

(defn update-cell [cells x y]
  (let [cell (get-in cells [y x])
        neighbors (count (filter #(= % 1) (get-neighbors cells x y)))
        alive? (if (= cell 1)
                 (#{2 3} neighbors)
                 (= neighbors 3))]
    (if alive? 1 0)))

(defn tick
  "Returns the next generation of the cells."
  [cells]
  (for [y (range (count cells))]
    (for [x (range (count (cells y)))]
      (update-cell cells x y))))
