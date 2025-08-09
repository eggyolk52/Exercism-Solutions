(import (rnrs))

(define (square n)
  (if (or (< n 1)
          (> n 64))
      (throw 'number-out-of-range n)
      (expt 2 (- n 1))))

(define (total)
  (let loop ((i 1)
             (sum 0))
    (if (<= i 64)
        (loop (+ i 1) (+ sum (square i)))
        sum)))
