(ns resistor-color-duo)

(defn resistor-value
  "Returns the resistor value based on the given colors."
  [colors]
  (let [values ["black"
                "brown"
                "red"
                "orange"
                "yellow"
                "green"
                "blue"
                "violet"
                "grey"
                "white"]
        a (.indexOf values (get colors 0))
        b (.indexOf values (get colors 1))]
    (Integer/parseInt (str a b))))
