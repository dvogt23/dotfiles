;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

; (load "server")
; (unless (server-running-p) (server-start))

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dmitrij Vogt"
      user-mail-address "dima@vogt.dev")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Privat/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))


; leave insert mode with jj
(setq-default evil-escape-key-sequence "jj")

;(require 'org-superstar)
;(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
;(setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))

(use-package org
  :ensure org-plus-contrib
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

  (setq org-refile-targets
    '(("Archive.org" :maxlevel . 1)
      ("Tasks.org" :maxlevel . 1)))

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-tag-alist
    '((:startgroup)
       ; Put mutually exclusive tags here
       (:endgroup)
       ("@errand" . ?E)
       ("@home" . ?H)
       ("@work" . ?W)
       ("agenda" . ?a)
       ("planning" . ?p)
       ("publish" . ?P)
       ("batch" . ?b)
       ("note" . ?n)
       ("idea" . ?i)))


  (define-key global-map (kbd "C-c j")
    (lambda () (interactive) (org-capture nil "jj"))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package! doct
  :commands (doct))

(after! org-capture
  <<prettify-capture>>
  (add-transient-hook! 'org-capture-select-template
    (setq org-capture-templates
          (doct `((,(format "%s\tPersonall todo" (all-the-icons-octicon "checklist" :face 'all-the-icons-green :v-adjust 0.01))
                   :keys "t"
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %?"
                              "%i %a")
                   )
                  )))))


;(after! org
;  (appendq! +ligatures-extra-symbols
;            `(:checkbox      "☐"
;              :pending       "◼"
;              :checkedbox    "☑"
;              :list_property "∷"
;              :em_dash       "—"
;              :ellipses      "…"
;              :title         "𝙏"
;              :subtitle      "𝙩"
;              :author        "𝘼"
;              :date          "𝘿"
;              :property      "☸"
;              :options       "⌥"
;              :latex_class   "🄲"
;              :latex_header  "⇥"
;              :beamer_header "↠"
;              :attr_latex    "🄛"
;              :attr_html     "🄗"
;              :begin_quote   "❮"
;              :end_quote     "❯"
;              :caption       "☰"
;              :header        "›"
;              :results       "🠶"
;              :begin_export  "⯮"
;              :end_export    "⯬"
;              :properties    "⚙"
;              :end           "∎"
;              :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
;              :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
;              :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
;              :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
;              :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)))
;  (set-ligatures! 'org-mode
;    :merge t
;    :checkbox      "[ ]"
;    :pending       "[-]"
;    :checkedbox    "[X]"
;    :list_property "::"
;    :em_dash       "---"
;    :ellipsis      "..."
;    :title         "#+title:"
;    :subtitle      "#+subtitle:"
;    :author        "#+author:"
;    :date          "#+date:"
;    :property      "#+property:"
;    :options       "#+options:"
;    :latex_class   "#+latex_class:"
;    :latex_header  "#+latex_header:"
;    :beamer_header "#+beamer_header:"
;    :attr_latex    "#+attr_latex:"
;    :attr_html     "#+attr_latex:"
;    :begin_quote   "#+begin_quote"
;    :end_quote     "#+end_quote"
;    :caption       "#+caption:"
;    :header        "#+header:"
;    :begin_export  "#+begin_export"
;    :end_export    "#+end_export"
;    :results       "#+RESULTS:"
;    :property      ":PROPERTIES:"
;    :end           ":END:"
;    :priority_a    "[#A]"
;    :priority_b    "[#B]"
;    :priority_c    "[#C]"
;    :priority_d    "[#D]"
;    :priority_e    "[#E]"))
;(plist-put +ligatures-extra-symbols :name "⁍")


;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
