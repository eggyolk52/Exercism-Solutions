;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:
(defun decimal-to-binary (num &optional lst)
  (cond ((= num 0) (cons 0 lst))
        ((= num 1) (cons 1 lst))
        ((decimal-to-binary (/ num 2) (cons (mod num 2) lst)))))

(defun allergen-list (num)
  (let ((list '("eggs"
                "peanuts"
                "shellfish"
                "strawberries"
                "tomatoes"
                "chocolate"
                "pollen"
                "cats"))
        (reversed-binaries (reverse (decimal-to-binary num)))
        (result '()))

    (dotimes (i (length reversed-binaries))
      (let ((binary (nth i reversed-binaries))
            (allergen (nth i list)))

        (if (and (= binary 1) (stringp allergen))
            (setq result (cons allergen result)))))
    (reverse result)))

(defun allergic-to-p (num str)
  (member str (allergen-list num)))

;;; allergies.el ends here
