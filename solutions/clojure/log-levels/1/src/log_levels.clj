(ns log-levels
  (:require [clojure.string :as str]))

(def pattern (re-pattern #"^ *\[(ERROR|WARNING|INFO)\]:((?s).*)"))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (as-> s $
    (re-matches pattern $)
    (nth $ 2)
    (str/trim $)))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (str/lower-case (second (re-matches pattern s))))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (let [[_ level message] (re-matches pattern s)
        level (str/trim (str/lower-case level))
        message (str/trim message)]
    (str message " (" level ")")))
