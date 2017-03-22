;; 各種カラーを変更する
;; (サポートする色の種類は"$EMACS/$VERSION/etc/rgb.txt"を参照)
(set-background-color "#111133")         ;; 標準の背景色
(set-face-background 'default "#111133") ;; 標準の背景色
(set-face-foreground 'default "white")   ;; 標準の文字色
(set-face-background 'menu "grey94")         ;; メニュー
(set-face-background 'tool-bar "grey94")     ;; ツールバー
(set-face-background 'mode-line "royal blue");; モードライン
(set-face-background 'scroll-bar "#333366")  ;; スクロールバー
(set-face-foreground 'tooltip "black")       ;; ツールチップの文字色
(set-face-background 'tooltip "wheat")       ;; ツールチップの背景色
(set-face-font       'tooltip "ricty-18")    ;; ツールチップで表示されるフォント
(set-cursor-color "white")
;; モードラインの文字の色を設定します。
(set-face-foreground 'mode-line "yellow")
;; モードラインの背景色を設定します。
;(set-face-background 'mode-line "MediumPurple2")
;(set-face-background 'region "DeepSkyBlue4")
(set-face-background 'region "dark magenta")


;; フレームパラメータ初期値の設定
(if (and window-system (>= emacs-major-version 23))
    (progn
      (set-frame-font "ricty-24")
      (setq initial-frame-alist
	    (append (list
		     ;; サイズ
		     '(width .  174)  ; 横幅（桁数）
		     '(height . 88) ; 高さ（行数）
		     ;; 位置
		     '(top . 7)  ; フレーム左上角 y 座標（ピクセル）
		     '(left. 0) ; フレーム左上角 x 座標（ピクセル）
		     ;; カーソル
		     '(cursor-type . box) ; 種類
		     '(cursor-height . 4) ; 高さ
		     ;; スクロールバー
		     '(vertical-scroll-bars . right)
		     )
		    initial-frame-alist))
      )
  ;; 以下、ターミナルで実行したときの設定
  (set-background-color "black")           ;; 標準の背景色
  (set-face-background 'default "black")   ;; 標準の背景色
  (set-face-foreground 'default "white")   ;; 標準の文字色
  )

;; 起動画面を表示しない
(setq inhibit-startup-screen t)

;; リージョンのハイライト表示を行う
(transient-mark-mode 1)

;; 対応する括弧をハイライト表示する
(show-paren-mode 1)

;; カーソル位置の桁数を表示する
(column-number-mode 1)

;; 時間を表示させる
(display-time)

;; tool-bar を出さないようにする
(tool-bar-mode 0)

;; menu-bar を出さないようにする
(menu-bar-mode 0)

; 画面を縦に分割したときも、行の折り返しをする
(setq truncate-partial-width-windows nil)

;; バッファ上でカラーコードに色をつける
(require 'rainbow-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

;; 現在行をハイライト
; 問答無用で全バッファにおいて有効にする場合は、以下の文をコメントアウトする
; (global-hl-line-mode t)
; 現在行のハイライト表示を行うモードを列挙
(add-hook 'emacs-lisp-mode-hook 'hl-line-mode)
(add-hook 'c-mode-hook 'hl-line-mode)
(add-hook 'c++-mode-hook '(hl-line-mode nil))
(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'html-mode-hook 'hl-line-mode)
(add-hook 'nxml-mode-hook 'hl-line-mode)
(add-hook 'text-mode-hook 'hl-line-mode)
(add-hook 'python-mode-hook 'hl-line-mode)
; ハイライト表示の色を指定
(custom-set-faces
'(hl-line ((t (:background "midnight blue"))))
)


;;--- 画面左に行番号を表示するための設定
(require 'linum)
(global-linum-mode 1)
; F6キーで行番号の表示／非表示を切り替える
(global-set-key [f6] 'linum-mode)
; 行番号表示部のフォーマットを設定する（番号４桁分＋空白文字）
(setq linum-format "%4d ")
; 動作を少し軽くするための設定
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))


;;--- emacs起動後に実行する各種カスタマイズ（外観に関連するもの）
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (split-window-vertically)    ; 画面を上下に２分割する
	    (enlarge-window 15)          ; ウィンドサイズを15行分縦に拡げる
	    (split-window-horizontally)  ; 画面を左右に２分割する
	    ))

(provide 'appearance)
;;; appearance.el ends here