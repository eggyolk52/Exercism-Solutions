;;; grains.el --- Grains exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun square (n)
  (expt 2 (1- n)))

(defun total ()
  (let ((sum 0))
    (dotimes (count 64)
      (setq sum (+ sum (square (1+ count))))) sum))

(provide 'grains)
;;; grains.el ends here
