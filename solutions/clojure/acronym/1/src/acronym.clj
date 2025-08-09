(ns acronym)

(require '[clojure.string :as str])

(defn acronym
  "Converts phrase to its acronym."
  [phrase]
  (apply str
         (as-> phrase $
           (str/replace $ #"[^a-zA-Z -]" "")
           (str/replace $ #"-" " ")
           (str/split $ #" +")
           (mapv first $)
           (mapv str/upper-case $))))
