;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:
(defun etl (hash-tbl)
  (let ((new-tbl (make-hash-table)))
    (maphash (lambda (k v) (if (< k 0)
                               (error "Key `%s' is not a valid score")
                             (mapc (lambda (letter) (if (not (stringp letter))
                                                        (error "Value `%s' is not a string" letter)
                                                      (puthash (downcase letter) k new-tbl)))
                                   v)))
             hash-tbl)
    new-tbl))

(provide 'etl)
;;; etl.el ends here
