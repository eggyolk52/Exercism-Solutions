(ns two-fer)

(defn two-fer
  "Return what you will say as you give away the extra cookie"
  ([name] (str "One for " name ", one for me."))
  ([] "One for you, one for me."))
