(ns secret-handshake)

(defn commands [num]
  (let [binary (Integer/toBinaryString num)]
    (cond-> []
      (re-matches #".*1$"        binary) (conj "wink")
      (re-matches #".*1[01]{1}$" binary) (conj "double blink")
      (re-matches #".*1[01]{2}$" binary) (conj "close your eyes")
      (re-matches #".*1[01]{3}$" binary) (conj "jump")
      (re-matches #".*1[01]{4}$" binary) reverse)))
