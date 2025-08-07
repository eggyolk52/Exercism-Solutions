#lang racket

(provide two-fer)

(define (two-fer name)
  (if (string? name)
    (string-append "One for " name ", one for me.")
    "One for you, one for me."))
