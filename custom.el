(custom-set-variables)
(custom-set-faces)

(if (eq system-type 'darwin)
    ;; custom stuff that was taken out of init.el
    (add-to-list 'load-path "/Users/Josef/tramp/lisp/")
  (add-to-list 'load-path "/Users/Josef/tramp/contrib")
  (require 'tramp)
  
  ;; Trying to add python mode
  ;;(add-to-list 'load-path "/Users/Josef/python-mode-1.0alpha")
  ;;(require 'python-mode)
  
  ;; Javascript mode
  ;;(add-to-list 'load-path "/Users/Josef/js2-mode")
  ;;(require 'js2-mode)
  ;;(autoload 'js2-mode "js2-mode" nil t)
  ;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; verilog mode
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))
  
(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))
;; Look first in the directory ~/elisp for elisp files
(prepend-path "~/elisp")
;; Load verilog mode only when needed
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; Any files that end in .v, .dv or .sv should be in verilog mode
(add-to-list 'auto-mode-alist '("\\.[ds]?v\\'" . verilog-mode))
;; Any files in verilog mode should have their keywords colorized
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))

;; Fix tabs for verilog mode
(add-hook 'verilog-mode-hook '(lambda ()
(add-hook 'local-write-file-hooks
(lambda() (untabify (point-min) (point-max))))))

;; python jedi emacs stuff
(add-hook 'python-mode-hook 'jedi:setup)

;; be sure el-get is set up
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))

;; (el-get 'sync)
)


