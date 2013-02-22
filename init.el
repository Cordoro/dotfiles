;; Red Hat Linux default .emacs initialization file

(toggle-text-mode-auto-fill)
(toggle-uniquify-buffer-names)

;; bind goto-line
(global-set-key "\C-xg" 'goto-line) 

;; start emacsserver
;;(server-start)

;; for-each
;; --------
;; Copy the active region multiple times, each time replacing all
;; occurences of a placeholder matching a regexp with an incremented
;; number.  Useful for creating numbered list.  Use this multiple times
;; with different place holders for multi-dimensional expansions.
;;
(defun for-each (begin end place start stop step)
  "Copy the active region and replace a placeholder string with a number."
  (interactive "r\nsPlaceholder: \nn Start: \nn Stop: \nn Step: ")
  (let ((template (buffer-substring begin end))
        (count (1+ (/ (- stop start) step))))
    (delete-region begin end)
    (dotimes (time count)
      (let ((value (number-to-string (+ start (* time step))))
            (expansion template))
        (while (string-match place expansion)
          (setq expansion (replace-match value nil t expansion)))
        (insert expansion)))))


;; Removed in favor of the custom.el version
;; ;; stuff for verilog mode
;; (defun prepend-path ( my-path )
;; (setq load-path (cons (expand-file-name my-path) load-path)))

;; (defun append-path ( my-path )
;; (setq load-path (append load-path (list (expand-file-name my-path)))))
;; ;; Look first in the directory ~/elisp for elisp files
;; (prepend-path "~/elisp")
;; ;; Load verilog mode only when needed
;; (autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; ;; Any files that end in .v should be in verilog mode 
;; (setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist)) 
;; ;; Any files in verilog mode should have their keywords colorized 
;; (add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1))) 
;; ;; end verilog mode stuff

;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Turn on font-lock mode for Emacs
(cond ((not running-xemacs)
       (global-font-lock-mode t)
))

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
;; (setq next-line-add-newlines nil)

;; Enable wheelmouse support by default
(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

;; display the time last so we know everything else parsed OK.                                                                         
(line-number-mode 1)
(load "time")
(setq display-time-day-and-date t)
(display-time)

(custom-set-variables
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(default-major-mode (quote text-mode))
 '(font-lock-maximum-decoration t)
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))



