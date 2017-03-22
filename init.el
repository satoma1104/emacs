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
(load-file "~/emacs/japanese.el")

;; turn on font-lock mode
(global-font-lock-mode t)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; ug-mode
(load-file "~/emacs/ug.el")

;; ユーザプログラム起動用パッケージ
(load-file "~/emacs/user-program.el")

;; コメント自動入力パッケージ
(load-file "~/emacs/comment.el")

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
    (highlight-symbol auto-highlight-symbol magit rainbow-mode company-quickhelp expand-region mark-multiple company flycheck ## flylisp)))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))


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


;; expand region（選択範囲の拡大および縮小機能）
;;(add-to-list 'load-path "~/.emacs.d/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

;; transient-mark-modeが nilでは動作しませんので注意
(transient-mark-mode t)

;; バッファの切り替えができるようにする
(global-set-key (kbd "M-[") 'switch-to-prev-buffer)
(global-set-key (kbd "M-]") 'switch-to-next-buffer)


;; ファイルの先頭が"#!"で始まるスクリプトの時は、自動的に実行属性をオンにする
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;(split-window-vertically)
;(enlarge-window 15)
;(split-window-horizontally)

(provide 'init)
;;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "midnight blue")))))
