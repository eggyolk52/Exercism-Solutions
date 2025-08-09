;;; all-your-base.el --- All Your Base (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun rebase (list-of-digits in-base out-base)
  (cond ((< in-base 2) (error "Base to small" in-base))
        ((< out-base 2) (error "Base to small" out-base)))

  (if (equal '() list-of-digits)
      '(0)
    (decimal-to-base out-base (base-to-decimal in-base list-of-digits))))

(defun decimal-to-base (base decimal)
  (if (= decimal 0)
      '(0)
    (let ((digits '()))
      (while (> decimal 0)
        (setq digits (cons (mod decimal base) digits))
        (setq decimal (floor (/ decimal base))))
      digits)))

(defun base-to-decimal (base digits)
  (let ((count 0)
        (sum 0))
    (dolist (digit (reverse digits))
      (if (< digit 0) (error "Invalid digit"))
      (if (and (= base 2) (> digit 1)) (error "Invalid digit"))

      (setq sum (+ sum (* digit (expt base count))))
      (setq count (1+ count)))
    sum))

(base-to-decimal 2 '(1 1 1 1))

(provide 'all-your-base)
;;; all-your-base.el ends here
