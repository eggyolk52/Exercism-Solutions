;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:
(defun hamming-distance (a b)
  (if (not (= (length a) (length b)))
      (error "Strings must be of equal lengths")
    (length (remove t (mapcar (lambda (i) (if (char-equal (elt a i)
                                                          (elt b i))
                                              t))
                              (number-sequence 0 (1- (length a))))))))

(provide 'hamming)
;;; hamming.el ends here
