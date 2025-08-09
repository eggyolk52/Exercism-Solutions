(ns anagram)

(defn anagram? [first second]
  (let [lower clojure.string/lower-case
        elements #(-> %
                      lower
                      seq
                      sort
                      )]
    (and
     (not= (lower first) (lower second))
     (= (elements first) (elements second)))))

(defn anagrams-for [word prospect-list]
  (filterv #(anagram? word %) prospect-list))
