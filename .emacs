;;; Emacs-Config --- Summary

;;; Commentary:

;;; Code:
;; Custimization from emacs menu
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-linum-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "InputMono" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))

;; Packages
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

;; Indentation
(setq-default c-default-style "linux"
	      c-basic-offset 2
	      tab-width 2
	      indent-tabs-mode t)
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

;; Flycheck
;;(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c++-mode-hook (lambda() (setq flycheck-gcc-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda() (setq flycheck-gcc-include-path "/usr/local/include/boost")))


;; CMake mode
;;(setq load-path (cons (expand-file-name "~/.emacs/elpa/cmake-mode-20151012.726/") load-path))
;;(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakeLists.txt" . cmake-mode))
(add-to-list 'auto-mode-alist '(".cmake" . cmake-mode))

;; ??? for understanding ====
;;(autoload 'cmake-project-mode "cmake-project" nil t)
;;(defun maybe-cmake-project-hook ()
;;  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
;;(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
;;(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)


(provide '.emacs)
;;; .emacs ends here
