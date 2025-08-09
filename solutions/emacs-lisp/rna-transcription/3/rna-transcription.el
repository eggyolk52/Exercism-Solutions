;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun to-rna (dna)
  (concat (seq-map (lambda (i) (cond ((= i ?G) ?C)
                                     ((= i ?C) ?G)
                                     ((= i ?T) ?A)
                                     ((= i ?A) ?U)))
                   dna)))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
