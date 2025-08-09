(ns rotational-cipher)

(require '[clojure.string :as str])

(def alpha-lower (vec "abcdefghijklmnopqrstuvwxyz"))

(def alpha-upper (vec "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))

(def letters (set (concat alpha-lower alpha-upper)))

(defn lower-case? [s]
  (= (str s) (str/lower-case s)))

(defn rotate-letter [letter num]
  (let [alpha (if (lower-case? letter) alpha-lower alpha-upper)]
    (as-> letter $
      (.indexOf alpha $)
      (+ num $)
      (mod $ (count alpha))
      (nth alpha $))))

(defn rotate [s num]
  (->> s
       (map #(if (contains? letters %)
               (rotate-letter % num)
               %))
       (apply str)))
