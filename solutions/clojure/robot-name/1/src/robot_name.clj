(ns robot-name)

(def used-names (atom #{}))

(defn robot []
  (atom (random-name)))

(defn robot-name [robot]
  @robot)

(defn reset-name [robot]
  (let [new-name (random-name (robot-name robot))]
    (reset! robot new-name)))

(defn random-name [& prev-name]
  (loop []
    (let [new-name (generate-name)]
      (if (@used-names new-name)
        (recur)
        (do
          (swap! used-names conj new-name)
          new-name)))))

(defn generate-name []
  (str (random-char)
       (random-char)
       (random-digit)
       (random-digit)
       (random-digit)))

(defn random-char []
  (char (+ 65 (rand 26))))

(defn random-digit []
  (int (rand 10)))

(comment
  (let [r (robot)]
    (robot-name r)
    (reset-name r)
    (reset-name r)
    (reset-name r))
  @used-names
  (@used-names "CB191")
  (random-name)
  )
