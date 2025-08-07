(ns run-length-encoding)

(require '[clojure.string :as str])

(defn run-length-encode
  "Encodes a string with run-length encoding."
  [plain-text]
  (->> (vec plain-text)
       (partition-by identity)
       (reduce (fn [acc elem]
                 (let [count (count elem)]
                   (-> acc
                       (conj (if (= count 1) "" count))
                       (conj (first elem)))))
               [])
       (apply str)))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [cipher-text]
  (->> cipher-text
       (re-seq #"[0-9]*[a-zA-Z ]")
       (reduce (fn [acc elem]
                 (let [match (re-find #"^[0-9]+" elem)
                       num (if match (Integer/parseInt match) 1)]
                   (->> (re-find #"[a-zA-Z ]$" elem)
                        (repeat num)
                        (apply str)
                        (conj acc))))
               [])
       (apply str)))
