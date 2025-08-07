;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(require 'seq)

(defun square-of-sum (n)
  (expt (seq-reduce #'+ (number-sequence 1 n) 0) 2))

(defun sum-of-squares (n)
  (seq-reduce #'+ (mapcar (lambda (n) (* n n)) (number-sequence 1 n)) 0))

(defun difference (n)
    (- (square-of-sum n) (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
