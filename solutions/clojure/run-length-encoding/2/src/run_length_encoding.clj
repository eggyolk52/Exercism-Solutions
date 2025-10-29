(ns run-length-encoding)

(require '[clojure.string :as str])

(defn run-length-encode
  "Encodes a string with run-length encoding."
  [plain-text]
  (->> (partition-by identity plain-text)
       (mapcat (fn [group]
                 (let [count (count group)
                       letter (first group)]
                   (if (= count 1)
                     [letter]
                     [count letter]))))
       (apply str)))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [cipher-text]
  (->> cipher-text
       (re-seq #"([0-9]*)([a-zA-Z ])")
       (mapcat (fn [[_ num letter]]
                 (let [count (if (empty? num) 1 (Integer/parseInt num))]
                   (repeat count letter))))
       (apply str)))
