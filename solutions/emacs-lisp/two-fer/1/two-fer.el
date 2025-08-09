;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:
(defun two-fer (&optional name)
  (if name
      (concat "One for " name ", one for me.")
    "One for you, one for me."))

(provide 'two-fer)
;;; two-fer.el ends here
