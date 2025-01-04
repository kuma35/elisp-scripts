;;; query-replace-enclosed-backtick-to-plus.el --- for AsciiDoc.
;; Copyright (C) 2025 Kuma35
;; Author: kuma35
;; Maintainer: kuma35
;; Keywords: asciidoc
;; Created: 2025/01/05 (year/month/day)
;; URL: https://github.com/kuma35/elisp
;; Package-Requires: (replace)
;;; Commentary:
;; Query replace Asciidoc `...` to +...+
;; AsciiDoc 10.2.0, `word` rendering to @samp{word} in info.
;; displayed 'word'
;; But `word phrase` rendering to @samp{work} @samp{phrase}
;; displayed 'word' 'phrase'
;; in html, <code>word</code> <code>phrase</code>
;; displayed word phrase
;; (monospace font's word, space, monospace font's phrase)
;; workaround: `word` -> `word` (nothing do)
;; `word phrase` -> +word phrase+
;; in info: @samp{word phrase}
;; in html; <code>word phrase</code>
;; CAUTION: It does not detect phrases that span line breaks.
;; Why? because it increases the number of false positives.
;; When you want to detect phrases that span multiple lines:
;; "`\\(\\(?:[^` ]+\s+\\)+[^` ]+\\)`" ( delete \n )
;;
;;
;;; Change Log:
;; 2025/01/05 first release.
;;; Code:

(declare-function
 query-replace-regexp "replace"
 (REGEXP TO-STRING &optional DELIMITED START END
	 BACKWARD REGION-NONCONTIGUOUS-P))

(defun query-replace-enclosed-backtick-to-plus ()
  "Query replace enclosed back-tick to enclosed plus for AsciiDoc.
CAUTION: It does not detect phrases that span line breaks."
  (interactive)
  (require 'replace)
  (query-replace-regexp
   "`\\(\\(?:[^`\n ]+\s+\\)+[^`\n ]+\\)`"
   "\+\\1\+")
  )

(provide 'query-replace-enclosed-backtick-to-plus)
;;; query-replace-enclosed-backtick-to-plus.el ends here
