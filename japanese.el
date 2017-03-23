;; 日本語環境にする
;(set-language-environment "Japanese")

;(prefer-coding-system 'utf-8-unix)	; 日本語入力のための設定
(set-default-coding-systems 'utf-8-dos) 
;(setq default-file-name-coding-system 'shift_jis) ;diredで日本語file名出力
(setq default-file-name-coding-system 'utf-8-dos) ;diredで日本語file名出力

;; 文字コーディングをEUCにする
;(set-default-coding-systems 'euc-jp)
;(set-buffer-file-coding-system 'euc-jp-unix)
;(set-terminal-coding-system 'euc-jp)
;(set-keyboard-coding-system 'euc-jp)

;;*****************************************************************************
;; anthy関係の設定
;;*****************************************************************************

; anthy.el をロードできるようにする (必要に応じて)。
(push "/usr/local/share/emacs/site-lisp/anthy/" load-path)

; anthy.el をロードする。
(load-library "anthy")
;(load-file "/usr/share/emacs/24.5/lisp/leim/leim-list.el")
(load-file "/usr/share/emacs/site-lisp/anthy/leim-list.el")

; japanese-anthy をデフォルトの input-method にする。
(setq default-input-method "japanese-anthy")

; 変換時の文字の色
(set-face-foreground 'anthy-highlight-face "white")

; 変換時の背景の色
(set-face-background 'anthy-underline-face "indian red")
(set-face-background 'anthy-highlight-face "maroon")

; アンダーライン消去
(set-face-underline 'anthy-highlight-face nil)
(set-face-underline 'anthy-underline-face nil)

; 入力と変換がなぜか遅い現象を修正する設定
(if (>= emacs-major-version 22)
    (setq anthy-accept-timeout 1))


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
