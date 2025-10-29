;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:
(defun leap-year-p (year)
  (cond ((= 0 (mod year 400)) t)
        ((= 0 (mod year 100)) nil)
        ((= 0 (mod year 4)) t)))

(provide 'leap-year-p)
;;; leap.el ends here
