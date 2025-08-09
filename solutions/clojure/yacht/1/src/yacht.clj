(ns yacht)

(defn combination [dice num]
  (* num (count (filter #(= num %) dice))))

(defn straight [dice type]
  (let [dice-sums {:little (reduce + (range 1 6))
                   :big (reduce + (range 2 7))}
        dice-sum (dice-sums type)]
    (and (= 5 (count (set dice)))
         (= dice-sum (reduce + dice)))))

(defn full-house [dice]
  (let [freq (frequencies dice)
        first-val (first (vals freq))]
    (and (= (count freq) 2)
         (or (= first-val 2)
             (= first-val 3)))))

(defn four-of-a-kind [dice]
  (if (= (count (set dice)) 1)
    (* (first dice) 4) ;; Yacht can be scored as Four of a Kind
    (let [freq (frequencies dice)
          kind (last (sort-by #(second %) freq))]
      (if (and (= (count freq) 2)
               (= (second kind) 4))
        (* (first kind) (second kind))
        0))))

(defn score [dice category]
  (cond
    (= category "yacht") (if (= (count (set dice)) 1) 50 0)
    (= category "ones") (combination dice 1)
    (= category "twos") (combination dice 2)
    (= category "threes") (combination dice 3)
    (= category "fours") (combination dice 4)
    (= category "fives") (combination dice 5)
    (= category "sixes") (combination dice 6)
    (= category "full house") (if (full-house dice) (reduce + dice) 0)
    (= category "four of a kind") (four-of-a-kind dice)
    (= category "little straight") (if (straight dice :little) 30 0)
    (= category "big straight") (if (straight dice :big) 30 0)
    (= category "choice") (reduce + dice)))
