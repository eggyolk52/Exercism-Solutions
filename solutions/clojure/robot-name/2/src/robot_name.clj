(ns robot-name)

(def used-names (atom #{}))

(defn random-char []
  (char (+ 65 (rand 26))))

(defn random-digit []
  (int (rand 10)))

(defn generate-name []
  (str (random-char)
       (random-char)
       (random-digit)
       (random-digit)
       (random-digit)))

(defn random-name []
  (loop []
    (let [new-name (generate-name)]
      (if (@used-names new-name)
        (recur)
        (do
          (swap! used-names conj new-name)
          new-name)))))

(defn robot []
  (atom (random-name)))

(defn robot-name [robot]
  @robot)

(defn reset-name [robot]
  (let [new-name (random-name (robot-name robot))]
    (reset! robot new-name)))
