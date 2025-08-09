(ns accumulate)

(defn accumulate [f coll]
  (loop [old-coll coll
         new-coll '()]
    (if (empty? old-coll)
      (reverse new-coll)
      (recur (rest old-coll) (cons (f (first old-coll)) new-coll)))))
