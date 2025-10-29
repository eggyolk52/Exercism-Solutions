;;; grains.el --- Grains exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun square (n)
  (expt 2 (1- n)))

(defun total ()
  (1- (square (1+ 64))))

(provide 'grains)
;;; grains.el ends here
