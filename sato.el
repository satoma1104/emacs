;; Red Hat Linux default .emacs initialization file

(setq load-path (cons (expand-file-name "/usr/local/share/emacs/site-lisp/yatex") load-path))
(setq load-path (cons (expand-file-name "~/emacs/matlab") load-path))

;; emacs上でgitの操作を行えるようにする
(require 'magit)

;; C-kで一行削除を行えるようにする
(setq kill-whole-line t)

; 自動セーブを OFF にする
(setq auto-save-defalut nil)
;; ニョロ（~）ファイルを作らない
(setq make-backup-files nil)
;; ~/.saves-PID-hostname という名前の中間ファイルを作らない
(setq auto-save-list-file-prefix nil)

;; 一行スクロール定義
(defun scroll-up-one-line ()
  "Scroll up one line."
    (interactive)
    (scroll-up 1))
(defun scroll-down-one-line ()
  "Scroll down one line."
  (interactive)
  (scroll-down 1))

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; ホイールマウスを使えるようにする
(require 'mwheel)

;; Cモードのときのフォーマットの設定
(add-hook 'c-mode-common-hook'
	  (lambda()
	    (setq c-basic-offset '4)
	    (setq indent-tabs-mode nil)))

;; ファイルの拡張子によって起動するメジャーモードを選択する
(setq auto-mode-alist
      (append
       '(("\\.tex$"   . yatex-mode)    ;; ".tex"ファイルはYaTeXモード
	 ("\\.gp$"    . gnuplot-mode)  ;; ".gp"ファイルはgnuplotモード
	 ("\\.inp$"   . c++-mode)
	 ("\\.cu$"    . c++-mode)      ;; ".cu"ファイルはC++モード
;	 ("\\.py$"    . python-mode)
	 ("\\.l$"     . c-mode)
	 ("\\.m$"     . matlab-mode)
	 ("Make.def$" . makefile-mode)
	 ("Make.dep$" . makefile-mode)
	 ("Make.sub$" . makefile-mode)
	 ("MakeHead$" . makefile-mode)
	 ( "\\.d\\'"  . c++-mode))
       auto-mode-alist))

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(autoload 'gnuplot-mode "gnuplot" "Gnuplot mode" t)
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
;(autoload 'python-mode "Python-mode" "Python-Mode" t)

;; YaTeXのデフォルト漢字コードをEUCにする (3:EUC)
(setq YaTeX-kanji-code 3)

;; カーソルキーでのスクロール行数を１行にする
(setq scroll-step 1)

;; Diredで圧縮ファイルの中身を閲覧できるようにする
(load "jka-compr")

;; Diredの表示形式(オプション)を指定する
;(setq dired-listing-switches "-algFGh1")
(setq dired-listing-switches "-al")

(setq auto-mode-alist
      (cons (cons "Make.def$" 'makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons (cons "Make.dep$" 'makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons (cons "Make.sub$" 'makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons (cons "Makehead$" 'makefile-mode) auto-mode-alist))

;; shell モードで color ls を有効にする
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; shell-mode 上のパスワード入力を隠す
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)

;; 日本語環境におけるshell-mode上のパスワード入力を隠す設定
(add-hook 'shell-mode-hook
	  '(lambda()
	     (setq comint-password-prompt-regexp
		   (concat comint-password-prompt-regexp "\\|パスワード.*:\\s *\\'"))))

;; 日本語環境におけるeshell上のパスワード入力を隠す設定
(add-hook 'eshell-mode-hook
	  '(lambda()
	     (setq eshell-password-prompt-regexp
		   (concat eshell-password-prompt-regexp "\\|パスワード.*:\\s *\\'"))))

;; ビープ音を消す
(setq ring-bell-function 'ignore)
