;;*****************************************************************************
;; anthy関係の設定
;;*****************************************************************************

; anthy.el をロードする。
(load-library "anthy")
(load-file "/usr/share/emacs/site-lisp/anthy/leim-list.el")

; 変換時の文字の色
(set-face-foreground 'anthy-highlight-face "white")

; 変換時の背景の色
(set-face-background 'anthy-underline-face "indian red")
(set-face-background 'anthy-highlight-face "maroon")

; アンダーライン消去
(set-face-underline 'anthy-highlight-face nil)
(set-face-underline 'anthy-underline-face nil)


;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)

;; C-SPC は Set Mark に使う
;(ibus-define-common-key ?\C-\s nil)
;; C-/ は Undo に使う
;(ibus-define-common-key ?\C-/ nil)
;; IBusの状態によってカーソル色を変化させる
;(setq ibus-cursor-color '("red" "blue" "limegreen"))
;; C-j で半角英数モードをトグルする
;(ibus-define-common-key ?\C-j t)

;(ibus-define-common-key 'C-henkan t)


;; Keybindings
;(global-set-key (kbd "C-\\") 'ibus-toggle)
;(global-set-key (kbd "M-o") (lambda () (interactive) (ibus-enable "m17n:sa:vz-prefix")))
;(global-set-key (kbd "C-o") (lambda () (interactive) (ibus-enable "mozc-jp")))
;(global-set-key (kbd "C-<f7>")
;                (lambda ()
;                  (interactive)
;                  (shell-command-to-string
;                   "/usr/lib/mozc/mozc_tool --mode=word_register_dialog")))
