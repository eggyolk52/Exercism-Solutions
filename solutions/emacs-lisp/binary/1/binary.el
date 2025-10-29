;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:
(require 'seq)

(defun to-decimal (num)
  (seq-reduce '+
              (seq-map-indexed (lambda (n i) (* n (expt 2 i)))
                               (reverse (mapcar #'string-to-number (split-string num "" t))))
              0))

(provide 'binary)
;;; binary.el ends here
