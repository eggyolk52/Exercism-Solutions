;;; gigasecond.el --- Gigasecond exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun from (second minute hour day month year)
  (butlast
   (decode-time
    (time-add (expt 10 9)
              (encode-time second minute hour day month year
                           nil nil t))
    t)
   3))

(provide 'gigasecond)
;;; gigasecond.el ends here
