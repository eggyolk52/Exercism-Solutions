#lang racket

(provide square total)

(define (square a-square)
  (arithmetic-shift 1 (sub1 a-square)))

(define (total)
  (sub1 (square 65)))
