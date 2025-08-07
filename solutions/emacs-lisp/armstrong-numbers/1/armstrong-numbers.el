;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:
(require 'seq)

(defun armstrong-p (num)
  (let* ((digits (mapcar #'string-to-number (split-string (int-to-string num) "" t)))
         (len (length digits)))
    (= num
       (seq-reduce #'+
                   (mapcar (lambda (digit) (expt digit len))
                           digits)
                   0))))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
