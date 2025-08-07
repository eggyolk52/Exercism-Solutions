;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:
(require 'seq)
(require 'subr-x)

(defun to-roman (n)
  (let ((number-list (reverse (split-number n))))
    (string-join (reverse (remq nil (list (roman-1 (nth 0 number-list))
                                          (if (nth 1 number-list)
                                              (roman-10 (nth 1 number-list)))
                                          (if (nth 2 number-list)
                                              (roman-100 (nth 2 number-list)))
                                          (if (nth 3 number-list)
                                              (roman-1000 (nth 3 number-list)))
                                          ))) "")))

(defun split-number (n)
  (mapcar #'string-to-number (split-string (number-to-string n) "" t)))

(defun roman-1 (n)
  (cond ((= n 0) nil)
        ((< n 4) (make-string n ?I))
        ((= n 4) "IV")
        ((= n 5) "V")
        ((< n 9) (concat "V" (make-string (- n 5) ?I)))
        ((= 9) "IX")))

(defun roman-10 (n)
  (cond ((= n 0) nil)
        ((< n 4) (make-string n ?X))
        ((= n 4) "XL")
        ((= n 5) "L")
        ((< n 9) (concat "L" (make-string (- n 5) ?X)))
        ((= 9) "XC")))

(defun roman-100 (n)
  (cond ((= n 0) nil)
        ((< n 4) (make-string n ?C))
        ((= n 4) "CD")
        ((= n 5) "D")
        ((< n 9) (concat "D" (make-string (- n 5) ?C)))
        ((= 9) "CM")))

(defun roman-1000 (n)
  (make-string n ?M))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
