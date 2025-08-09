(ns pangram)

(require '[clojure.set :as set]
         '[clojure.string :as str])

(defn pangram?
  "Returns true if the given string is a pangram; otherwise, returns false"
  [s]
  (set/subset?
   (set "abcdefghijklmnopqrstuvwxyz")
   (set (str/lower-case s))))
