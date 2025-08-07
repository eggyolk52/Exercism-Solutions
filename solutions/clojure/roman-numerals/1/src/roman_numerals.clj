(ns roman-numerals)

(require '[clojure.string :as str])

(defn numerals
  "Convert a number to its roman numeral(s)"
  [n]
  (-> (loop [n n
             result []]
        (cond
          (>= n 1000) (recur (- n 1000) (conj result "M"))
          (>= n  500) (recur (- n  500) (conj result "D"))
          (>= n  100) (recur (- n  100) (conj result "C"))
          (>= n   50) (recur (- n   50) (conj result "L"))
          (>= n   10) (recur (- n   10) (conj result "X"))
          (>= n    5) (recur (- n    5) (conj result "V"))
          (>= n    1) (recur (- n    1) (conj result "I"))
          :else (apply str result)))
      (str/replace "DCCCC" "CM")
      (str/replace  "CCCC" "CD")
      (str/replace "LXXXX" "XC")
      (str/replace  "XXXX" "XL")
      (str/replace "VIIII" "IX")
      (str/replace  "IIII" "IV")))
