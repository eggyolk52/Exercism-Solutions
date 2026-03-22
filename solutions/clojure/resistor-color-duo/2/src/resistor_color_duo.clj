(ns resistor-color-duo)

(defn resistor-value
  "Returns the resistor value based on the given colors."
  [colors]
  (let [values {"black" 0
                "brown" 1
                "red" 2
                "orange" 3
                "yellow" 4
                "green" 5
                "blue" 6
                "violet" 7
                "grey" 8
                "white" 9}
        a (values (get colors 0))
        b (values (get colors 1))]
    (Integer/parseInt (str a b))))
