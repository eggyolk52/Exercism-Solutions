(import (rnrs))

(define (two-fer . maybe-name)
  (if (eq? '() maybe-name)
      "One for you, one for me."
      (string-append "One for " (car maybe-name) ", one for me.")))
