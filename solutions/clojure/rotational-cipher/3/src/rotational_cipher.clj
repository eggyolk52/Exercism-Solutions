(ns rotational-cipher)

(def alpha-lower (vec "abcdefghijklmnopqrstuvwxyz"))

(def alpha-upper (map Character/toUpperCase alpha-lower))

(defn rotate-letter [letter num]
  (let [alpha (if (Character/isLowerCase letter) alpha-lower alpha-upper)]
    (as-> letter $
      (.indexOf alpha $)
      (+ num $)
      (mod $ (count alpha))
      (nth alpha $))))

(defn rotate [s num]
  (->> s
       (map #(if (Character/isLetter %)
               (rotate-letter % num)
               %))
       (apply str)))
