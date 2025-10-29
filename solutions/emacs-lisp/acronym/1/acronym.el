;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:
(defun acronym (str)
  (upcase (mapconcat (lambda (word) (substring word 0 1))
                     (split-string str "[ \-]")
                     "")))

(acronym "Complementary metal-oxide semiconductor")

(provide 'acronym)
;;; acronym.el ends here
