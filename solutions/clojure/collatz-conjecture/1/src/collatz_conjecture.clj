(ns collatz-conjecture)

(defn collatz [num]
  (cond
    (= num 1) 0
    (< num 1) (throw (IllegalArgumentException. "<1 not allowed!"))
    :else (loop [num num
                 rep 0]
            (cond
              (= num 1) rep
              (even? num) (recur (/ num 2) (inc rep))
              :else (recur (inc (* num 3)) (inc rep))))))
