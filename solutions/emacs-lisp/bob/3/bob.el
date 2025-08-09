;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun response-for (s)
  (let ((alpha-p (string-match-p "[[:alpha:]]" s))
        (yell-p (string= s (upcase s)))
        (question-p (string-suffix-p "?" (string-trim s))))
    (cond ((string-blank-p s) "Fine. Be that way!")
          ((and alpha-p yell-p question-p) "Calm down, I know what I'm doing!")
          ((and alpha-p yell-p) "Whoa, chill out!")
          (question-p "Sure.")
          (t "Whatever."))))

(provide 'bob)
;;; bob.el ends here
