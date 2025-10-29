#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares number)
  (apply + (build-list number (lambda (n)
                                (* (add1 n) (add1 n))))))

(define (square-of-sum number)
  (expt (apply + (build-list number add1))
        2))

(define (difference number)
  (- (square-of-sum number)
     (sum-of-squares number)))
