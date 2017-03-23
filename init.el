;; 個人の設定

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; 外観の設定
(load-file "~/.emacs.d/appearance.el")

(load-file "~/.emacs.d/sato.el")

;; 日本語の設定
(load-file "~/.emacs.d/japanese.el")

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
    (wgrep browse-kill-ring+ browse-kill-ring highlight-symbol auto-highlight-symbol magit rainbow-mode company-quickhelp expand-region mark-multiple company flycheck ## flylisp)))
 '(show-paren-mode t nil (paren))
 )


;; MELPAの設定
(load-file "~/.emacs.d/melpa.el")

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
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

;; バッファの切り替えができるようにする
(global-set-key (kbd "M-[") 'switch-to-prev-buffer)
(global-set-key (kbd "M-]") 'switch-to-next-buffer)

;; browse-kill-ringの機能をM-yで使用できるようにする
(browse-kill-ring-default-keybindings)


;;;--- wgrep関係の設定(grepバッファの編集)
;; eでwgrepモードにする
(setf wgrep-enable-key "e")
;; wgrep終了時にバッファを保存
(setq wgrep-auto-save-buffer t)
;; read-only bufferにも変更を適用する
(setq wgrep-change-readonly-file t)


;; ファイルの先頭が"#!"で始まるスクリプトの時は、自動的に実行属性をオンにする
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;(split-window-vertically)
;(enlarge-window 15)
;(split-window-horizontally)

(provide 'init)
;;; init.el ends here
