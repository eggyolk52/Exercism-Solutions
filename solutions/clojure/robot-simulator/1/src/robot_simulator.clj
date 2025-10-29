(ns robot-simulator)

(def cardinals
  {:north {\L :west
           \R :east}
   :east  {\L :north
           \R :south}
   :south {\L :east
           \R :west}
   :west  {\L :south
           \R :north}})

(defn robot [coordinates bearing]
  {:coordinates coordinates
   :bearing bearing})

(defn advance [direction robot]
  (let [bearing (get robot :bearing)
        coord (get robot :coordinates)
        coord (cond
                (= bearing :north) (assoc coord :y (inc (coord :y)))
                (= bearing :east)  (assoc coord :x (inc (coord :x)))
                (= bearing :south) (assoc coord :y (dec (coord :y)))
                (= bearing :west)  (assoc coord :x (dec (coord :x))))]
    (assoc robot :coordinates coord)))

(defn turn [direction robot]
  (let [cur-bearing (get robot :bearing)
        new-bearing (get-in cardinals [cur-bearing direction])]
    (assoc robot :bearing new-bearing)))

(defn simulate [directions robot]
  (reduce (fn [robot direction]
            (cond
              (= direction \A) (advance direction robot)
              (or (= direction \L)
                  (= direction \R)) (turn direction robot)))
          robot
          directions))

