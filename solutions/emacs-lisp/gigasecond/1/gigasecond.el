;;; gigasecond.el --- Gigasecond exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun from (second minute hour day month year)
  (butlast
   (decode-time
    (encode-time
     (+ second (expt 10 9)) minute hour day month year nil nil t)
    t)
   3))

(provide 'gigasecond)
;;; gigasecond.el ends here
