(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4])

(defn today [birds]
  (last birds))

(defn inc-bird [birds]
  (assoc birds (- (count birds) 1) (+ 1 (last birds))))

(defn day-without-birds? [birds]
  (if (some #(= 0 %) birds)
    true
    false))

(defn n-days-count [birds n]
  (reduce + (take n birds)))

(defn busy-days [birds]
  (count (filter #(<= 5 %) birds)))

(defn odd-week? [birds]
  (= birds [1 0 1 0 1 0 1]))
