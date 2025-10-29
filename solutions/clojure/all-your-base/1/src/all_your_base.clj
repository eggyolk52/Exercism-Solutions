(ns all-your-base)

(defn to-decimal [nums base]
  (let [length (count nums)]
    (loop [result []
           index 0
           power (- length index 1)]
      (if (< index length)
        (let [num (nth nums index)]
          (recur (conj result (* num (int (Math/pow base power))))
                 (inc index)
                 (dec power)))
        (reduce + result)))))

(defn to-base [num base]
  (if (= num 0)
    '(0)
    (loop [result '()
           num num]
      (if (< num 1)
        result
        (recur (conj result (mod num base))
               (int (Math/floor (/ num base))))))))

(defn convert [base nums new-base]
  (cond
    (or (< base 2)
        (< new-base 2)) nil
    (= nums '()) '()
    (some #(or (<= base %)
               (< % 0)) nums) nil
    :else (to-base (to-decimal nums base) new-base)))
