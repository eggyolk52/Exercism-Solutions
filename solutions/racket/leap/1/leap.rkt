#lang racket

(provide leap-year?)

(define (leap-year? year)
  (define (evenly-divisible-by? n)
    (= 0 (modulo year n)))
  (or (evenly-divisible-by? 400)
      (and (not (evenly-divisible-by? 100))
           (evenly-divisible-by? 4))))
