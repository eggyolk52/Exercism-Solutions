(ns leap)

(defn leap-year?
  "Returns true if the given year is a leap year;
  otherwise, it returns false."
  [year]
  (let [div-by? (fn [a b] (zero? (mod a b)))]
    (and (div-by? year 4)
         (or (not (div-by? year 100))
             (div-by? year 400)))))
