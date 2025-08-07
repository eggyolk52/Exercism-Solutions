(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [cars-per-hour (double 221)]
    (cond
      (= speed 0)                     (double 0)
      (and (>= speed 1) (<= speed 4)) (* speed cars-per-hour)
      (and (>= speed 5) (<= speed 8)) (* speed cars-per-hour 0.90)
      (= speed 9)                     (* speed cars-per-hour 0.80)
      (= speed 10)                    (* speed cars-per-hour 0.77))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
