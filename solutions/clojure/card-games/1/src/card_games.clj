(ns card-games)

(defn rounds
  "Takes the current round number and returns
   a `list` with that round and the _next two_."
  [n]
  (range n (+ n 3)))

(defn concat-rounds
  "Takes two lists and returns a single `list`
   consisting of all the rounds in the first `list`,
  followed by all the rounds in the second `list`"
  [l1 l2]
  (into (vec l1) (vec l2)))

(defn contains-round?
  "Takes a list of rounds played and a round number.
   Returns `true` if the round is in the list, `false` if not."
  [l n]
  (contains? (set l) n))

(defn card-average
  "Returns the average value of a hand"
  [hand]
  (float (/ (apply + hand) (count hand))))

(defn approx-average?
  "Returns `true` if average is equal to either one of:
  - Take the average of the _first_ and _last_ number in the hand.
  - Using the median (middle card) of the hand."
  [hand]
  (let [first (first hand)
        last (last hand)
        real (card-average hand)
        approx (float (/ (+ first last) 2))
        median (float (nth (sort hand) (int (/ (count hand) 2))))]
    (or (= real approx)
        (= real median))))

(defn average-even-odd?
  "Returns true if the average of the cards at even indexes
   is the same as the average of the cards at odd indexes."
  [hand]
  (let [evens (filter even? (range))
        odds (filter odd? (range))
        f (fn [nums] (map
                      #(nth hand %)
                      (take-while #(< % (count hand)) nums)))]
    (= (card-average (f evens))
       (card-average (f odds)))))

(defn maybe-double-last
  "If the last card is a Jack (11), doubles its value
   before returning the hand."
  [hand]
  (let [jack 11]
    (if (= (last hand) jack)
      (conj (vec (butlast hand)) (* jack 2))
      hand)))
