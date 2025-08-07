(ns eliuds-eggs)

(defn egg-count
  "Returns the number of 1 bits in the binary representation of the given number."
  [number]
  (->> number
       Integer/toBinaryString
       (filterv #(= % \1))
       count))
