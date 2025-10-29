(ns etl)

(require '[clojure.string :as str])

(defn transform [source]
  (loop [source (vec source)
         result {}]
    (if (empty? source)
      result
      (let [elem (first source)
            score (first elem)
            letters (->> elem second (map str/lower-case))
            maps (map #(assoc {} % score  ) letters)]
        (recur (rest source) (into result maps))))))
