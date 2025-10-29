(ns scrabble-score)

(require '[clojure.string :as str])

(defn score-word
  "Calculate a word's scrabble score"
  [word]

  (let [binary (Integer/toBinaryString word)
        handshake (as-> [] $
                    (if (re-matches #".*1$"        binary) (conj $ "wink") $)
                    (if (re-matches #".*1[01]{1}$" binary) (conj $ "double blink") $)
                    (if (re-matches #".*1[01]{2}$" binary) (conj $ "close your eyes") $)
                    (if (re-matches #".*1[01]{3}$" binary) (conj $ "jump") $))]
    (str/join
     ", "
     (if (re-matches #".*1[01]{4}$" binary)
       (reverse handshake)
       handshake))))
