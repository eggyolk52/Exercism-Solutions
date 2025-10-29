;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:
(require 'seq)

(defun word-count (phrase)
  (let* ((word-list (mapcar #'downcase (split-string (replace-regexp-in-string
                                                      "[.,:;!?\"&@$%^]" "" phrase))))
         (uniq-list (seq-uniq word-list)))
    (seq-map (lambda (i) (cons i (seq-count (lambda (j) (string= i j))
                                            word-list)))
             uniq-list)))

(provide 'word-count)
;;; word-count.el ends here
