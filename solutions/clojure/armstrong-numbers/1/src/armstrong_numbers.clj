(ns armstrong-numbers)

(defn armstrong? [num]
  (= num
     (let [digits (clojure.string/split (str num) #"")
           len (count digits)]
       (reduce (fn [accum digit]
                 (+ accum
                    (reduce * (repeat len digit))))
               0
               (map read-string digits)))))
