;;; alabaster-theme.el --- A light theme with minimal amount of highlighting

;;; Copyright © 2020 - Wanderson Ferreira <wand@hey.com>

;; Original from Nikita Prokopov (tonsky) at https://github.com/tonsky/vscode-theme-alabaster

;; This file is not part of GNU Emacs, but is distributed under the same terms.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; (load-theme 'alabaster t)

;;; Code:

(deftheme alabaster "A light theme with a minimal amount of highlighting.")

(defgroup alabaster nil
  "alabaster theme customization.
The theme needs to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom alabaster-boldless nil
  "Use bold text in less code constructs."
  :type 'boolean
  :group 'alabaster)

(make-face 'font-lock-numbers)
(make-face 'font-lock-punctuation)

(let ((class '((class color) (min-colors 89)))
      (alabaster-fg        "#000")
      (alabaster-bg        "#F7F7F7")
      (alabaster-comments  "#AA3731")
      (alabaster-strings   "#448C27")
      (alabaster-keywords  "#7A3E9D")
      (alabaster-fn-names  "#325CC0")
      (alabaster-punctuation "#777777")
      (alabaster-paren-match "#777777")
      (alabaster-paren-match-bg "gray85")
      (alabaster-line-hl   "#F0F0F0")
      (alabaster-hl        "#FFE9A6")
      (alabaster-region    "#E0E0E0")
      (alabaster-cursor-fg "#007ACC")
      
      (alabaster-fringe-bg   "#F0F0F0")
      (alabaster-fringe-fg   "#007ACC")
      (alabaster-modeline-bg "#DDDDDD")
      (alabaster-modeline-fg "#474747")

      (alabaster-black      "#000000")
      (alabaster-blue       "#325CC0")
      (alabaster-light-blue "#007ACC")
      (alabaster-red        "#AA3731")
      (alabaster-green      "#448C27"))

  (custom-theme-set-faces
   'alabaster
   `(default ((,class (:foreground ,alabaster-fg :background ,alabaster-bg))))

   ;; base
   `(error ((,class (:foreground ,alabaster-red))))
   `(warning ((,class (:foreground ,alabaster-red))))
   `(success ((,class (:foreground ,alabaster-green))))
   `(bold ((,class (:foreground ,alabaster-punctuation))))

   `(font-lock-builtin-face ((,class (:foreground ,alabaster-fn-names))))
   `(font-lock-comment-face ((,class (:foreground ,alabaster-comments))))
   `(font-lock-constant-face ((,class (:foreground ,alabaster-keywords))))
   `(font-lock-function-name-face ((,class (:foreground ,alabaster-fn-names))))
   `(font-lock-keyword-face ((,class (:foreground ,alabaster-black))))
   `(font-lock-string-face ((t (:foreground ,alabaster-strings))) t)
   `(font-lock-type-face ((t (:foreground ,alabaster-fn-names))))
   `(font-lock-variable-name-face ((,class (:foreground ,alabaster-fn-names))))
   `(font-lock-regexp-grouping-backslash ((,class :foreground ,alabaster-punctuation)))
   `(font-lock-regexp-grouping-construct ((,class :foreground ,alabaster-punctuation)))
   `(font-lock-warning-face ((,class (:foreground ,alabaster-red))))
   `(font-lock-numbers ((,class (:foreground ,alabaster-keywords))))
   `(font-lock-punctuation ((,class (:foreground ,alabaster-punctuation))))

   ;; clojure
   `(clojure-character-face ((,class (:foreground ,alabaster-strings))))
   `(clojure-keyword-face ((,class (:foreground ,alabaster-keywords))))
   `(cider-deprecated-face ((,class (:foreground ,alabaster-black))))
   `(cider-instrumented-face ((,class (:foreground ,alabaster-black))))
   `(cider-traced-face ((,class (:foreground ,alabaster-black))))
   `(cider-reader-conditional-face ((,class (:foreground ,alabaster-black))))

   ;; diff highlight
   `(diff-hl-insert ((,class (:background ,alabaster-green))))
   `(diff-hl-delete ((,class (:background ,alabaster-red))))
   `(diff-hl-change ((,class (:background ,alabaster-blue))))

   `(persp-selected-face ((,class (:foreground ,alabaster-light-blue))))

    ;; ui
   `(cursor ((,class (:background ,alabaster-cursor-fg))))
   `(fringe ((,class (:background ,alabaster-fringe-bg :foreground ,alabaster-fringe-fg))))
   ;; `(vertical-border ((,class (:foreground ,alabaster-fringe-fg))))
   ;; `(minibuffer-prompt ((,class (:foreground ,alabaster-blue-6 :weight bold))))
   `(mode-line ((,class (:box (:line-width -1 :style released-button) :background ,alabaster-modeline-bg :foreground ,alabaster-modeline-fg))))
   `(mode-line-inactive ((,class (:box (:line-width -1 :style released-button) :background ,alabaster-line-hl :foreground ,alabaster-punctuation))))
   ;; `(link ((,class (:underline t :foreground ,alabaster-blue-6))))
   ;; `(link-visited ((,class (:underline t :foreground ,alabaster-blue-5))))
   `(highlight ((,class (:background ,alabaster-hl))))
   `(hl-line ((,class (:background ,alabaster-line-hl :inverse-video nil))))
   `(region ((,class (:background ,alabaster-region))))
   `(lazy-highlight ((,class (:background ,alabaster-hl :inverse-video nil))))
   `(isearch ((,class (:background ,alabaster-hl :inverse-video nil))))
   `(secondary-selection ((,class (:background ,alabaster-hl))))

   ;; org mode
   `(org-todo ((,class (:foreground ,alabaster-red))))
   `(org-done ((,class (:foreground ,alabaster-green))))

   ;; parenthesis
   `(show-paren-match ((,class (:foreground ,alabaster-paren-match :background ,alabaster-paren-match-bg))))
   `(show-paren-mismatch ((,class (:background ,alabaster-black))))))

(defun alabaster-font-rules ()
  "Enforce some font-lock-rules after initializing."
  
  ;; matching punctuation
  (font-lock-add-keywords nil '(("\\([\](){}<>''#\[]\\)" 1 'font-lock-punctuation t)))
  (font-lock-add-keywords nil '(("\\(\"\\)" 1 'font-lock-punctuation t)))
  
  ;; match numbers
  (font-lock-add-keywords nil '(("\\([0-9]+\\)" 1 'font-lock-numbers t))))

(add-hook 'prog-mode-hook 'alabaster-font-rules)

(with-eval-after-load 'cider
  (setq cider-font-lock-dynamically nil
        cider-font-lock-reader-conditionals nil))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'alabaster)
;;; alabaster-theme.el ends here
