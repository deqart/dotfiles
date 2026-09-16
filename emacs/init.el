;; -*- lexical-binding: t; -*-
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-screen t)

(setq tab-bar-show 1
      tab-bar-separator "")

(add-to-list 'tab-bar-tab-name-format-functions
             (lambda (name _tab _i) (concat " " name)))

(tab-bar-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq whitespace-style '(face tabs spaces trailing space-before-tab newline empty space-after-tab space-mark))
(global-whitespace-mode 1)

(show-paren-mode 1)

(line-number-mode 1)
(column-number-mode 1)

(load-theme 'raspberry t)

;;For font change
;;(set-face-attribute 'default nil :family <string> :height <int>)

(setq tab-bar-new-tab-choice "*scratch*")

(cua-mode 1)

(defvar-keymap custom-keymap
  "C-s"       #'save-buffer
  "C-d"       #'dired
  "C-f"       #'isearch-forward
  "C-r"       #'compile-and-run
  "C-h h"     #'help-quick-toggle
  "C-t"       #'tab-new
  "C-x t"     #'tab-close
  "M-<left>"  #'tab-previous
  "M-<right>" #'tab-next)

(add-to-list 'emulation-mode-map-alists `((custom-keymap . ,custom-keymap)) t)

(keymap-global-unset "C-x C-s")
(keymap-global-unset "C-x C-d")
(keymap-global-unset "C-x d")

(add-hook 'isearch-mode-hook
          (lambda ()
            (define-key isearch-mode-map (kbd "<left>")  #'isearch-edit-string)
            (define-key isearch-mode-map (kbd "<right>") #'isearch-edit-string)
            (define-key isearch-mode-map (kbd "<up>")    #'isearch-repeat-backward)
            (define-key isearch-mode-map (kbd "<down>")  #'isearch-repeat-forward)))

(setq make-backup-files nil)

(setq-default tab-width 4)

;; force indent-tabs-mode to nil with the exception of makefiles
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (unless (derived-mode-p 'makefile-mode)
              (indent-tabs-mode 0))))


(require 'cc-mode)

(c-add-style "custom"
             '("linux"
               (c-basic-offset . 4)
               (c-backslash-max-column . 100)
               (c-offsets-alist . ((innamespace . 0)
                                   (case-label . +)
                                   (statement-case-intro . +)
                                   (arglist-intro . +)
                                   (arglist-close . 0)))))

(setq c-default-style "custom")

(defvar startup-directory default-directory)

(setq compilation-finish-functions
      (lambda (buf str)
        (if (string-match "finished" str)
            (progn (delete-windows-on buf)))))

(defun compile-and-run ()
  (interactive)
  (let ((default-directory startup-directory)
        (compile-command ""))
    (cond
     ((file-exists-p "build.sh") (compile "./build.sh run"))
     ;;((file-exists-p "Makefile") (compile "make -k run"))
     (t (call-interactively #'compile)))))

(defconst load-file-directory (file-name-directory (or load-file-name buffer-file-name)))

(add-to-list 'load-path (concat load-file-directory "/modes"))
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
