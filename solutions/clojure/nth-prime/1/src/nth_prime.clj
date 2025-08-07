(ns nth-prime)

(defn prime? [n]
  (and (> n 1)
       (or (= n 2)
           (not-any? #(zero? (mod n %))
                     (range 2 (inc (Math/sqrt n)))))))

(defn nth-prime
  "Returns the nth prime number."
  [n]
  (nth (filter prime? (range)) (dec n)))
