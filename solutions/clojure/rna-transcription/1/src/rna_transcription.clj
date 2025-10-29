(ns rna-transcription)

(defn to-rna
  "Returns the RNA complement of the given DNA string sequence."
  [dna]
  (->> (vec dna)
       (map #(case %
               \G \C
               \C \G
               \T \A
               \A \U))
       (apply str)))
