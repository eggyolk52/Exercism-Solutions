(ns pig-latin)

(require '[clojure.string :as str])

(defn rule1 [word]
  (if (re-matches #"^([aeiou]|xr|yt).*" word)
    (str word "ay")
    word))

(defn rule2 [word]
  (let [match (re-matches #"^([^aeiou]+).*" word)]
    (if match
      (str
       (str/replace-first word (second match) "")
       (second match)
       "ay")
      word)))

(defn rule3 [word]
  (let [match (re-matches #"^([^aeiou]*qu).*" word)]
    (if match
      (str
       (str/replace-first word (second match) "")
       (second match)
       "ay")
      word)))

(defn rule4 [word]
  (let [match (re-matches #"^([^aeiou]+)y.*" word)]
    (if match
      (str
       (str/replace-first word (second match) "")
       (second match)
       "ay")
      word)))

(defn translate
  "Translates phrase from English to Pig Latin"
  [phrase]
  (->> (str/split phrase #" ")
       (map (fn [word]
              (let [rule1-word (rule1 word)
                    rule2-word (rule2 word)
                    rule3-word (rule3 word)
                    rule4-word (rule4 word)]
                ;; The tests require a particular application of the
                ;; rules.  Only one rule should be applied, and
                ;; precedence seems to follow this exact sequence: 1,
                ;; 4, 3, 2.
                (cond
                  (not= rule1-word word) rule1-word
                  (not= rule4-word word) rule4-word
                  (not= rule3-word word) rule3-word
                  (not= rule2-word word) rule2-word
                  :else word))))
       (str/join " ")))
