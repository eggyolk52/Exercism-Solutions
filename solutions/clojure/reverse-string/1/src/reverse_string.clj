(ns reverse-string)

(defn reverse-string [s]
  (apply str (reverse (seq s))))
