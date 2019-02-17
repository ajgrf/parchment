;;; -*- lexical-binding: t -*-

;; Copyright © 2019 Alex Griffin <a@ajgrf.com>
;;
;;
;; Permission to use, copy, modify, and/or distribute this software for
;; any purpose with or without fee is hereby granted, provided that the
;; above copyright notice and this permission notice appear in all
;; copies.
;;
;; THE SOFTWARE IS PROVIDED "AS IS" AND ISC DISCLAIMS ALL WARRANTIES WITH
;; REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL ISC BE LIABLE FOR ANY
;; SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
;; OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(deftheme parchment
  "A light colorscheme inspired by Acme and Leuven.")

(defvar parchment-want-modify-tty-colors nil
  "Whether to redefine the terminal colors that Emacs knows about.
Set to non-nil if you're using a matching parchment terminal theme.")

(defmacro style-theme (theme &rest styles)
  "Apply a list of face styles associated with theme THEME.
Wraps `custom-theme-set-faces' with a nice compact table-like syntax.

Each STYLE should be a list of the form:

  (FACE FOREGROUND BACKGROUND [ATTRIBUTES])

If foreground or background are nil then they will be skipped."
  (declare (indent 1))
  (let (forms)
    (while styles
      (pcase (pop styles)
        (`(,face ,fg ,bg . ,attrs)
         (push `(,'\` (,face ((t (,@(when fg `(:foreground (,'\, ,fg)))
                                  ,@(when bg `(:background (,'\, ,bg)))
                                  ,@attrs)))))
               forms))))
    `(custom-theme-set-faces
      ',theme
      ,@(nreverse forms))))

(let ((black   "#000000") (pale-gray    "#eaeaea")
      (red     "#880000") (pale-red     "#ffeaea")
      (green   "#005500") (pale-green   "#eaffea")
      (brown   "#663311") (yellow       "#eeee9e")
      (blue    "#004488") (pale-blue    "#cceeff")
      (magenta "#770077") (pale-magenta "#ffeaff")
      (cyan    "#007777") (pale-cyan    "#eaffff")
      (beige   "#eeeecc") (pale-yellow  "#ffffea"))

  (defun parchment-modify-tty-colors ()
    (tty-color-define "black"          0 (tty-color-standard-values black))
    (tty-color-define "red"            1 (tty-color-standard-values red))
    (tty-color-define "green"          2 (tty-color-standard-values green))
    (tty-color-define "yellow"         3 (tty-color-standard-values brown))
    (tty-color-define "blue"           4 (tty-color-standard-values blue))
    (tty-color-define "magenta"        5 (tty-color-standard-values magenta))
    (tty-color-define "cyan"           6 (tty-color-standard-values cyan))
    (tty-color-define "white"          7 (tty-color-standard-values beige))
    (tty-color-define "brightblack"    8 (tty-color-standard-values pale-gray))
    (tty-color-define "brightred"      9 (tty-color-standard-values pale-red))
    (tty-color-define "brightgreen"   10 (tty-color-standard-values pale-green))
    (tty-color-define "brightyellow"  11 (tty-color-standard-values yellow))
    (tty-color-define "brightblue"    12 (tty-color-standard-values pale-blue))
    (tty-color-define "brightmagenta" 13 (tty-color-standard-values pale-magenta))
    (tty-color-define "brightcyan"    14 (tty-color-standard-values pale-cyan))
    (tty-color-define "brightwhite"   15 (tty-color-standard-values pale-yellow)))

  (when parchment-want-modify-tty-colors
    (add-hook 'tty-setup-hook #'parchment-modify-tty-colors))

  (style-theme parchment
    ;; FACE                     FOREGROUND   BACKGROUND   ATTRIBUTES
    (default                    black        pale-yellow)
    (bold                       nil          nil          :weight bold)
    (italic                     nil          nil          :slant italic)
    (bold-italic                nil          nil          :weight bold :slant italic)
    (underline                  nil          nil          :underline t)
    (shadow                     brown        nil)
    (link                       cyan         nil          :underline t)
    (link-visited               magenta      nil          :underline t)
    (error                      red          nil)
    (warning                    red          nil)
    (success                    green        nil)

    (cursor                     nil          black)
    (fringe                     black        pale-gray)
    (header-line                nil          pale-cyan    :box t)
    (linum                      black        pale-gray)
    (mode-line                  pale-blue    blue         :box ,black)
    (mode-line-inactive         nil          pale-gray    :box t)
    (mode-line-highlight        nil          yellow)
    (mode-line-emphasis         pale-yellow  nil          :weight bold :distant-foreground ,black)
    (mode-line-buffer-id        pale-yellow  nil          :weight bold :distant-foreground ,black)

    (region                     nil          yellow)
    (hl-line                    nil          beige)
    (highlight                  nil          pale-blue)
    (match                      nil          yellow)
    (isearch                    nil          pale-blue    :weight bold)
    (isearch-fail               red          pale-red)
    (lazy-highlight             nil          nil          :weight bold)
    (show-paren-match           nil          pale-blue)
    (show-paren-mismatch        pale-yellow  red)
    (whitespace-line            red          pale-red)
    (whitespace-trailing        red          pale-red)

    (font-lock-warning-face     red          nil)
    (font-lock-function-name-face nil        nil)
    (font-lock-variable-name-face nil        nil)
    (font-lock-keyword-face     nil          nil)
    (font-lock-comment-face     brown        nil          :slant italic)
    (font-lock-type-face        nil          nil)
    (font-lock-constant-face    nil          nil)
    (font-lock-builtin-face     blue         nil)
    (font-lock-preprocessor-face magenta     nil)
    (font-lock-string-face      green        nil)
    (font-lock-doc-face         green        nil)

    (org-document-title         black        nil          :weight bold :height 1.8)
    (org-document-info          nil          nil)
    (org-document-info-keyword  cyan         pale-cyan)
    (org-meta-line              cyan         pale-cyan)
    (org-block-begin-line       black        pale-gray    :underline t)
    (org-block-end-line         black        pale-gray    :underline t)
    (org-block                  nil          beige)
    (org-level-1                black        pale-gray    :weight bold :height 1.3 :overline t)
    (org-level-2                blue         pale-cyan    :weight bold :overline t)
    (org-level-3                green        pale-green   :weight bold :overline t)
    (org-level-4                brown        nil          :weight bold)
    (org-level-5                magenta      nil          :weight bold)
    (org-level-6                cyan         nil          :weight bold :slant italic)
    (org-level-7                green        nil          :weight bold :slant italic)
    (org-level-8                brown        nil          :weight bold :slant italic)
    (org-todo                   red          pale-red     :weight bold :box t)
    (org-done                   cyan         pale-cyan    :weight bold :box t)

    (ledger-font-posting-date-face blue      nil)
    (ledger-occur-xact-face     nil          beige)
    (sh-quoted-exec             nil          nil)
    (vimrc-number               nil          nil)

    (comint-highlight-input     blue         nil          :weight bold)
    (comint-highlight-prompt    blue         nil          :weight bold)
    (dired-directory            blue         nil)
    (magit-section-heading      brown        nil          :weight bold)
    (which-key-key-face         magenta      nil)

    (elfeed-search-date-face    blue         nil)
    (elfeed-search-feed-face    brown        nil)
    (elfeed-search-tag-face     green        nil))

  (custom-theme-set-variables 'parchment
   ;; shell-mode colors
   `(ansi-color-names-vector
     [,black ,red ,green ,brown ,blue ,magenta ,cyan ,beige])))

;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'parchment)