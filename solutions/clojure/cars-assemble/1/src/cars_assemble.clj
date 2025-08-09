(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [cars-per-hour 221]
    (cond
      (= speed 0) (float 0)
      (and (>= speed 1) (<= speed 4)) (double (* speed cars-per-hour))  
      (and (>= speed 5) (<= speed 8)) (double (* speed (* cars-per-hour 0.90)))
      (and (= speed 9)) (* speed (* cars-per-hour 0.80))
      (and (= speed 10)) (double (/ (int (* 10 (* speed (* cars-per-hour 0.77)))) 10)))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
