(ns protein-translation)

(def codon-protein {"AUG" "Methionine"
                    "UUU" "Phenylalanine"
                    "UUC" "Phenylalanine"
                    "UUA" "Leucine"
                    "UUG" "Leucine"
                    "UCU" "Serine"
                    "UCC" "Serine"
                    "UCA" "Serine"
                    "UCG" "Serine"
                    "UAU" "Tyrosine"
                    "UAC" "Tyrosine"
                    "UGU" "Cysteine"
                    "UGC" "Cysteine"
                    "UGG" "Tryptophan"
                    "UAA" "STOP"
                    "UAG" "STOP"
                    "UGA" "STOP"})

(defn translate-codon [codon]
  (if (string? codon)
    (codon-protein codon)
    (loop [codon codon
           proteins []]
      (if (empty? codon)
        proteins
        (recur (rest codon)
               (conj proteins (codon-protein (first codon))))))))

(defn translate-rna [rna]
  (loop [rna rna
         proteins []]
    (if (empty? rna)
      proteins
      (let [codon (subs rna 0 3)
            protein (translate-codon codon)]
        (if (= protein "STOP")
          proteins
          (recur (subs rna 3)
                 (conj proteins protein)))))))

;; (defn translate-codon [codon]
;;   (if (string? codon)
;;     (codon-protein codon)
;;     (map #(codon-protein %) codon)))

;; (defn translate-rna [rna]
;;   (->> rna
;;        (re-seq #".{3}")
;;        (map translate-codon)
;;        (take-while #(not= "STOP" %))))
