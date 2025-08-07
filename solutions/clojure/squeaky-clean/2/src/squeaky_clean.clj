(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn clean
  [s]
  (-> s
      (str/replace #"\s" "_")
      (str/replace #"\p{Cc}" "CTRL")
      (str/replace #"-(.)" #(str/upper-case (% 1)))
      (str/replace #"[^\p{L}_]" "")
      (str/replace #"[α-ω]" "")))
