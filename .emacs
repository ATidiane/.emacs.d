;; Added by Package.el.  Thisb must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (ipython-shell-send pydoc-info python-mode pydoc fill-column-indicator switch-window undo-tree autopair smex minimap powerline el-get mu4e-maildirs-extension mu4e-alert multiple-cursors sphinx-doc python-docstring goose-theme py-isort better-defaults py-autopep8 material-theme ein flycheck magit clippy fireplace gnugo wttrin 2048-game speed-type grandshell-theme moe-theme ample-theme solarized-theme zenburn-theme messages-are-flowing aggressive-indent whitespace-cleanup-mode elpy)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(send-mail-function (quote mailclient-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;---------------- Getting started with MElpa --------------->>>
;; Important : Should be placed before the (package-initialize) line

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))



;;------------------- Initializing packages ------------------>>>

(package-initialize)

;;-------------------------- IPython ------------------------->>>

;; use IPython
(setq-default py-shell-name "ipython3")
(setq-default py-which-bufname "IPython")
;; ;; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;       '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)

;; ;; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ;; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ;; try to automagically figure out indentation
;; (setq py-smart-indentation t)

;;--------------------- Installing el-get -------------------->>>
;; It's important to call el-get before "package initialize" to avoid
;; package conflicts with melpa installed packages
;; Also checks if el-get is available and ready to
;; use every time.

;; I used it to install jedi, the most useful
;; auto-completion tool i've ever used M-x el-get-install

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;------- To automatically install packages when missing------>>>
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
;; (dolist (package package-selected-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;;-------------------------- Themes -------------------------->>>
;; Tweak the them by changing just a few colors
(defvar zenburn-override-colors-alist
  '(("zenburn-bg+05" . "#282828")
    ("zenburn-bg+1"  . "#2F2F2F")
    ("zenburn-bg+2"  . "#3F3F3F")
    ("zenburn-bg+3"  . "#4F4F4F")))
(load-theme 'zenburn nil)

;; (load-theme 'leuven t)

;; (load-theme 'goose t)

;; load material theme, from the tuto to install flycheck
;; (load-theme 'material t)

;; actual theme
(load-theme 'material-light t)


;;-------------------------- Jedi -------------------------->>>
;; Standard Jedi.el setting, for python

(setq jedi:server-command '("~/.emacs.d/elpa/jedi-core-20170121.610/jediepcserver.py"))
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t) ;; optional
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;;-------------------------- Elpy -------------------------->>>
;; Elpy, the Emacs Lisp Python Environment

(elpy-enable)
;; (elpy-use-ipython "ipython3")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;----------------------- Flycheck ------------------------->>>
;; Syntax checking

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Uncomment to color the warnings or errors.
;; (eval-after-load 'flycheck
;;   '(progn
;;      (set-face-attribute 'flycheck-warning nil
;;                          :underline '(:color "yellow"))
;;      (set-face-attribute 'flycheck-error nil
;;                          :underline '(:color "red"))))

;; (add-hook 'after-init-hook #'global-flycheck-mode)

;;------------------------- Ido ---------------------------->>>
;; Amazing flex-matching of directories and files.

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;---------------------- Py-autopep8 ----------------------->>>

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options (append py-autopep8-options '("--aggressive")))
(setq py-autopep8-options (append py-autopep8-options '("--aggressive")))

;;----------------------- Py-isort ------------------------->>>
;; Py-isort sorts imports

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

;;---------------------- Sphinx-doc ------------------------>>>

(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))

;;--------------------Multiple Cursors --------------------->>>

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-}") 'mc/mark-next-like-this)
(global-set-key (kbd "C-{") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-{") 'mc/mark-all-like-this)

;; Binding mouse events
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

;;-------------------- Icons in terminal ------------------->>>

;; Those two were required to add icons in terminal
(add-to-list 'load-path "~/.emacs.d/frame-local")
(require 'frame-local)

(add-to-list 'load-path "~/.emacs.d/font-lock+")
(require 'font-lock+)


(add-to-list 'load-path "~/.local/share/icons-in-terminal")
(require 'icons-in-terminal)
(insert (icons-in-terminal 'oct_flame))

;;------------------------ Sidebar-------------------------->>>

(add-to-list 'load-path "~/.emacs.d/sidebar")
(require 'sidebar)
;; (global-set-key (kbd "C-x C-f") 'sidebar-open)
(global-set-key (kbd "C-x C-a") 'sidebar-buffers-open)

;; C-h f icons-in-terminal[RET] for more info

;;---------------------- Powerline ------------------------->>>

(require 'powerline)
;; (powerline-default-theme)
(powerline-center-theme)
(setq powerline-default-separator 'wave)


;;-------------------- Undo Tree mode ---------------------->>>

(global-undo-tree-mode)

(global-set-key (kbd "M-/") 'undo-tree-visualize)

;;------------------ Fill column indictor ------------------>>>

;; (require 'fill-column-indicator)
;; (setq fci-rule-width 1)
;; (setq fci-rule-color "gray")
;; (define-globalized-minor-mode
;;   global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode t)


;;--------------------- Smex and AC ------------------------>>>

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; Enable auto complete even in here
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; Hyphen on Space, replace a space by "-"
(defadvice smex (around space-inserts-hyphen activate compile)
  (let ((ido-cannot-complete-command
         `(lambda ()
            (interactive)
            (if (string= " " (this-command-keys))
                (insert ?-)
              (funcall ,ido-cannot-complete-command)))))
    ad-do-it))

;; Update less often
(defun smex-update-after-load (unused)
  (when (boundp 'smex-cache)
    (smex-update)))
(add-hook 'after-load-functions 'smex-update-after-load)

;; Using acronyms
(defadvice ido-set-matches-1 (around ido-smex-acronym-matches activate)
  "Filters ITEMS by setting acronynms first."
  (if (and (fboundp 'smex-already-running) (smex-already-running) (> (length ido-text) 1))

      ;; We use a hash table for the matches, <type> => <list of items>, where
      ;; <type> can be one of (e.g. `ido-text' is "ff"):
      ;; - strict: strict acronym match (i.e. "^f[^-]*-f[^-]*$");
      ;; - relaxed: for relaxed match (i.e. "^f[^-]*-f[^-]*");
      ;; - start: the text start with (i.e. "^ff.*");
      ;; - contains: the text contains (i.e. ".*ff.*");
      (let ((regex (concat "^" (mapconcat 'char-to-string ido-text "[^-]*-")))
            (matches (make-hash-table :test 'eq)))

        ;; Filtering
        (dolist (item items)
          (let ((key))
            (cond
             ;; strict match
             ((string-match (concat regex "[^-]*$") item)
              (setq key 'strict))

             ;; relaxed match
             ((string-match regex item)
              (setq key 'relaxed))

             ;; text that start with ido-text
             ((string-match (concat "^" ido-text) item)
              (setq key 'start))

             ;; text that contains ido-text
             ((string-match ido-text item)
              (setq key 'contains)))

            (when key
              ;; We have a winner! Update its list.
              (let ((list (gethash key matches ())))
                (puthash key (push item list) matches)))))

        ;; Finally, we can order and return the results
        (setq ad-return-value (append (gethash 'strict matches)
                                      (gethash 'relaxed matches)
                                      (gethash 'start matches)
                                      (gethash 'contains matches))))

    ;; ...else, run the original ido-set-matches-1
    ad-do-it))



;;---------------------- Binding keys  --------------------->>>

(global-set-key "\C-cb" 'sh-mode)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-x C-x") 'recompile)
(global-set-key (kbd "C-x g") 'magit-status)

;;------------------- Other configurations  ---------------->>>

;; use only spaces and no tabs
(display-time)
(column-number-mode t)
(tool-bar-mode -1)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(add-hook 'before-save-hook 'whitespace-cleanup)
(global-aggressive-indent-mode t)
(global-linum-mode t)

;; (set-face-background 'linum "cyan")
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)


;;--------------------------- Fun -------------------------->>>

;; Speed Type, dactylo in emacs, Awesome
(add-to-list 'load-path "~/.emacs.d/speed-type/speed-type.el")
(require 'speed-type)

;; wttrin, Emacs frontend for weather web service
(setq-default wttrin-default-cities '("Paris"))
(setq-default wttrin-default-accept-language '("Accept-Language" . "fr"))

;;----------------------- Message mode --------------------->>>

(setq mail-user-agent 'message-user-agent)
(setq user-mail-address "baldeahmedtidiane36@gmail.com"
      user-full-name "Ahmed Tidiane BALDE")

;; use the default input method in message mode
(add-hook 'message-mode-hook 'toggle-input-method)

;; add Cc and Bcc headers to the message buffer
(setq message-default-mail-headers "Cc: \nBcc: \n")

;; postponed message is put in the following draft file
(setq message-auto-save-directory "~/Mail/drafts")


;; attach the content of a folder to a message

(defun message-attach-all-files-from-folder(&optional disposition dir-to-attach)
  "create the mml code to attach all files found in a given directory"
  (interactive)

  (if (eq disposition nil)
      (setq disposition (completing-read "Enter default disposition to use: " '(("attachment" 1) ("inline" 2)) nil t)))

  (if (eq dir-to-attach nil)
      (setq dir-to-attach (read-directory-name "Select a folder to attach: ")))

  (if (not (string-match "/$" dir-to-attach))
      (setq dir-to-attach (concat dir-to-attach "/")))

  (dolist (file (directory-files dir-to-attach))
    (when (and (not (string= "." file)) (not (string= ".." file)))
      (let (full-file-path mime-type)
        (setq full-file-path (concat dir-to-attach file))
        (if (file-readable-p full-file-path)
            (if (file-directory-p full-file-path)
                (message-attach-all-files-from-folder disposition full-file-path)

              (setq mime-type (substring (shell-command-to-string (concat "file --mime-type --brief " (shell-quote-argument (expand-file-name full-file-path)))) 0 -1))
              (insert-string (concat "<#part type=\"" mime-type "\" filename=\"" full-file-path "\" disposition=" disposition ">\n"))
              )
          )
        )
      )
    )
  )


;; colorizing multiply-quoted lines
(add-hook 'message-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("^[ \t]*>[ \t]*>[ \t]*>.*$"
                                       (0 'message-multiply-quoted-text-face))
                                      ("^[ \t]*>[ \t]*>.*$"
                                       (0 'message-double-quoted-text-face))))))
