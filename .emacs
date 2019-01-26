;;; package --- Summary

;;; Commentary:
;;; Install autopair
;;; Install elpy (https://elpy.readthedocs.io/en/latest/index.html)
;;; Install emms
;;; Install tomatinho
;;; Install frame-cmds
;;; install dockerfile-mode


;;; Code:
;;; Packages (only el-get!!!)
(require 'package)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)
(add-to-list 'package-archives
	     '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)


;; Autopair
(require 'autopair)
(autopair-global-mode)

;; IDO
(require 'ido)
(ido-mode t)

;; Tomatinho
(require 'tomatinho)
(global-set-key (kbd "<f12>") 'tomatinho)

;; ElPy
(require 'elpy)
(package-initialize)
(elpy-enable)

;; EMMS
;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)

;; CMake Mode
; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))
(autoload 'cmake-mode "~/.emacs.d/el-get/cmake-mode/cmake-mode.el" t)
(add-to-list 'load-path "~/.emacs.d/autoload/")
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; Customization
;; Key bindings
(add-to-list 'custom-theme-load-path "~/.emacs.d/custom-themes")
(load-theme 'calm-forest t)

;; Key bindings
;; Shrink
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; AVY
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("f641bdb1b534a06baa5e05ffdb5039fb265fde2764fbfd9a90b0d23b75f3936b" default)))
 '(display-battery-mode t)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(elpy-rpc-python-command "python")
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages (quote (org-plus-contrib org)))
 '(python-shell-interpreter "ipython")
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Input" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(tomatinho-reset-face ((t (:foreground "#333333"))))
 '(tomatinho-time-face ((t (:height 4.0 :width normal :family "Input")))))

(provide '.emacs)
;;; .emacs ends here
