(ns bob)

(require '[clojure.string :as str])

(defn question? [s]
  (= (last s) \?))

(defn yelling? [s]
  (and (re-find #"[A-Z]" s)
       (not (re-find #"[a-z]" s))))

(defn silence? [s]
  (= (str/trim s) ""))

(defn response-for [s]
  (let [s (str/trim s)]
    (cond
      (and (question? s) (yelling? s)) "Calm down, I know what I'm doing!"
      (question? s) "Sure."
      (yelling? s) "Whoa, chill out!"
      (silence? s) "Fine. Be that way!"
      :else "Whatever.")))

