;; 個人の設定

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; MELPAの設定
(load-file "~/.emacs.d/melpa.el")

;; 外観の設定
(load-file "~/.emacs.d/appearance.el")

(load-file "~/.emacs.d/sato.el")

;; 日本語の設定（Windows環境以外なら、anthyを使う）
(when (not (eq system-type 'windows-nt))
  (load-file "~/.emacs.d/japanese.el"))

;; turn on font-lock mode
(global-font-lock-mode t)

;; ug-mode
;(load-file "~/emacs/ug.el")

;; ユーザプログラム起動用パッケージ
;(load-file "~/emacs/user-program.el")

;; コメント自動入力パッケージ
(load-file "~/.emacs.d/comment.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(global-font-lock-mode t nil (font-lock))
 '(package-selected-packages
   (quote
    (sticky  win-switch wgrep browse-kill-ring+ browse-kill-ring highlight-symbol auto-highlight-symbol rainbow-mode company-quickhelp expand-region mark-multiple company flycheck ## flylisp)))
 '(show-paren-mode t nil (paren)))


;; 開発環境の整備
;; flycheckの設定
(load-file "~/.emacs.d/flycheck.el")

;;;--- キーワード補完機能設定
(load-file "~/.emacs.d/company.el")


;; mark-multiple（リファクタリング支援機能：変数・関数名一括変換）設定
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))


;;--- expand region（選択範囲の拡大および縮小機能）
;; (expand-regionがインストールされている必要がある)
(global-set-key (kbd "C-@") 'er/expand-region)   ;; リージョンを拡げる
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

;; バッファの切り替えができるようにする
(global-set-key (kbd "C-{") 'switch-to-next-buffer)
(global-set-key (kbd "C-}") 'switch-to-prev-buffer)

;; browse-kill-ringの機能をM-yで使用できるようにする
(browse-kill-ring-default-keybindings)

;; バッファ削除を簡単にできるようにする
(global-set-key (kbd "C-S-k") 'kill-buffer)

;; diredを簡単に開く
(global-set-key (kbd "C-S-d") 'dired)


;; スクロールを滑らかにする
;(smooth-scrolling-mode t)


;;;--- Wgrep関係の設定(grepバッファの編集)
;; eでwgrepモードにする
(setf wgrep-enable-key "e")
;; wgrep終了時にバッファを保存
(setq wgrep-auto-save-buffer t)
;; read-only bufferにも変更を適用する
(setq wgrep-change-readonly-file t)


;; ファイルの先頭が"#!"で始まるスクリプトの時は、自動的に実行属性をオンにする
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;; Shift + カーソルキーで、ウィンドウ間を自由に行き来できるようにする設定
(windmove-default-keybindings)
(global-set-key (kbd "C-S-o") 'other-window)
(global-set-key (kbd "C-z") 'undo)

;; 行番号による移動
(global-set-key (kbd "C-S-l") 'goto-line)
(load-file "~/.emacs.d/fast-cursor-move.el")


;; 反対側のウィンドウにいけるように
(setq windmove-wrap-around t)

;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;; 指定されたキーが押された時は、１文字だけSHIFTキーに相当する効果を与える
;; （sticky.elがインストールされていることが前提）
(require 'sticky)
; 以下では、"@"が押された時にstickyモードを有効にする
(use-sticky-key ?@ sticky-alist:ja)

;; 以下で指定したバッファは、カレントウィンドウに強制表示する
;(add-to-list 'same-window-buffer-names "*Buffer List*")
;; 以下で指定したバッファは、カレントウィンドウとは別ウィンドウに強制表示する
(add-to-list 'special-display-buffer-names "*BufferList*")

;; Ctrl-hにバックスペース機能を割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))


(provide 'init)
;;; init.el ends here
