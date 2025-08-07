;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun nucleotide-count (sequence)
  (let ((A 0) (C 0) (G 0) (T 0))
    (dolist (nucleotide (string-to-list sequence))
      (cond ((char-equal nucleotide ?A) (setq A (1+ A)))
            ((char-equal nucleotide ?C) (setq C (1+ C)))
            ((char-equal nucleotide ?G) (setq G (1+ G)))
            ((char-equal nucleotide ?T) (setq T (1+ T)))
            ((t (error "Not a valid nucleotide: %s" nucleotide)))))
    (list (cons ?A A) (cons ?C C) (cons ?G G) (cons ?T T))))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
