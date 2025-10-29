(ns binary-search)

(defn search-for [target seq]
  (loop [left 0
         right (dec (count seq))]
    (if (> left right)
      (throw (new Exception "not found")))
    (let [middle (int (/ (+ left right) 2))
          found (nth seq middle)]
      (cond
        (< found target) (recur (inc middle) right)
        (> found target) (recur left (dec middle))
        (= found target) middle))))

(defn middle [seq] ;; not used
  (int (/ (count seq) 2)))