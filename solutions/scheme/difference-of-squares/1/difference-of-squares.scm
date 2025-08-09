(import (rnrs))

(define (square-of-sum n)
  (let loop ((n n)
             (total 0))
    (if (= n 0)
        (expt total 2)
        (loop (- n 1) (+ total n)))))

(define (sum-of-squares n)
  (let loop ((n n)
             (total 0))
    (if (= n 0)
        total
        (loop (- n 1) (+ total (expt n 2))))))

(define (difference-of-squares n)
  (- (square-of-sum n) (sum-of-squares n)))
