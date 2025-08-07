(ns nucleotide-count)

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (if (contains? #{\A \C \G \T} nucleotide)
    (count (filter #(= % nucleotide) strand))
    (throw (Exception.))))

(defn nucleotide-counts [strand]
  (reduce (fn [acc elem]
            (if (contains? acc elem)
              (let [amount (get acc elem)]
                (assoc acc elem (inc amount)))
              (assoc acc elem 1)))
          {\A 0 \C 0 \G 0 \T 0}
          strand))
