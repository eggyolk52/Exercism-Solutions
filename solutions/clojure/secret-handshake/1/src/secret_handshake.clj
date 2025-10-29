(ns secret-handshake)

(defn commands [num]
  (let [binary (Integer/toBinaryString num)
        handshake (as-> [] $
                    (if (re-matches #".*1$"        binary) (conj $ "wink") $)
                    (if (re-matches #".*1[01]{1}$" binary) (conj $ "double blink") $)
                    (if (re-matches #".*1[01]{2}$" binary) (conj $ "close your eyes") $)
                    (if (re-matches #".*1[01]{3}$" binary) (conj $ "jump") $))]
    (if (re-matches #".*1[01]{4}$" binary)
      (reverse handshake)
      handshake)))
