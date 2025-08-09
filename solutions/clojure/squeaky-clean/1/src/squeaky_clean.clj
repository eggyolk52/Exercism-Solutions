(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn kebab->camel [s]
  (reduce (fn [acc pattern]
            (let [from (first pattern)
                  to (str/upper-case (second pattern))]
              (str/replace acc from to)))
          s
          (re-seq #"-(.)" s)))

(defn clean
  [s]
  (-> s
      (str/replace " " "_")
      (str/replace #"\p{Cc}" "CTRL")
      kebab->camel
      (str/replace #"[^\p{L}_]" "")
      (str/replace #"[α-ω]" "")
      ))
