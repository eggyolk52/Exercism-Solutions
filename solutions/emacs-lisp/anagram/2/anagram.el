;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:
(require 'seq)

(defun anagrams-for (word candidates)
  (seq-filter (lambda (candidate) (and (not (string= word candidate))
                                       (anagram-p word candidate)))
              candidates))

(defun anagram-p (word candidate)
  (string= (sort-string (downcase word))
           (sort-string (downcase candidate))))

(defun sort-string (string)
  (concat (seq-sort #'< (string-to-list string))))

(provide 'anagram)
;;; anagram.el ends here
