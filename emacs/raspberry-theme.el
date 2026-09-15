;; -*- lexical-binding: t; -*-
(deftheme raspberry
  "Raspberry color theme for emacs")

(custom-theme-set-faces
 'raspberry
 '(default ((t (:family "Noto Sans Mono" :foundry "ADBO" :width normal :height 80 :weight semi-bold :slant normal :underline nil :overline nil :extend nil :strike-through nil :box nil :inverse-video nil :foreground "#f6f3e8" :background "#242424" :stipple nil :inherit nil))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(tab-bar ((t (:background "#202020" :foreground "white" :box nil))))
 '(tab-bar-tab ((t (:background "#343434" :foreground "white" :weight bold :box nil))))
 '(tab-bar-tab-inactive ((t (:background "#141414" :foreground "gray" :box nil))))
 '(fringe ((t (:background "#202020"))))
 '(line-number-current-line ((t (:foreground "purple" :inherit line-number))))
 '(whitespace-space ((t (:foreground "gray30" :background nil))))
 '(whitespace-trailing ((t (:foreground "red" :background "red"))))
 '(font-lock-builtin-face ((t (:foreground "yellow1"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 ;;'(font-lock-comment-face ((t (:foreground "lime green"))))
 '(font-lock-comment-face ((t (:foreground "light grey"))))
 '(font-lock-constant-face ((t (:foreground "yellow3"))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue2"))))
 '(font-lock-keyword-face ((t (:foreground "IndianRed1"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-string-face ((t (:foreground "light green"))))
 '(font-lock-type-face ((t (:foreground "medium purple"))))
 '(font-lock-variable-name-face ((t (:foreground "sandy brown"))))
 '(font-lock-warning-face ((t (:inherit (error))))))

(provide-theme 'raspberry)
