;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun to-rna (dna)
  (string-join (mapcar (lambda (s) (cond ((string= s "G") "C")
                                         ((string= s "C") "G")
                                         ((string= s "T") "A")
                                         ((string= s "A") "U")
                                         (t (error "DNA not valid"))))
                       (split-string dna "" t)) ""))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
