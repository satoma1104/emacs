;; flycheckの設定

;; flycheckの読み込み
(require 'flycheck)

;;; flycheckを全てのモードにおいて有効にする
(global-flycheck-mode)

;; c++-mode用にオリジナルのチェッカーを定義
(flycheck-define-checker c/c++
  "A C/C++ checker using g++."
  :command ("g++" "-Wall" "-Wextra" "-std=c++11" source)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" column ":" " エラー: " (message)
                           line-end)
                    (warning line-start
                           (file-name) ":" line ":" column ":" " 警告: " (message)
                           line-end))
  :modes (c-mode c++-mode))

;; c++-modeで起動した時には、デフォルトチェッカーを上で定義した"c/c++"にする
(add-hook 'c++-mode-hook
	  '(lambda()
	     (flycheck-select-checker 'c/c++)))

;; flycheckに標準搭載のc/c++-langやc/c++-gccをC++11に準拠させる
(add-hook 'c++-mode-hook (lambda()
                           (setq flycheck-gcc-language-standard "c++11")
                           (setq flycheck-clang-language-standard "c++11")))

;; エラーや警告の内容を、該当箇所の直下に表示する
;; （flycheck-pos-tipパッケージが必要）
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
;; これを入れないと、マウスによるツールチップ表示でGTK+経由の変なツールチップが
;; 表示される
(setq x-gtk-use-system-tooltips nil)

;(eval-after-load 'flycheck
;  '(custom-set-variables
;    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

; エラーやワーニングの箇所に移動したり一覧を表示したりするキーバインドの定義
(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)

;; 以下、覚え書きとして残しておく記述
;(defmacro flycheck-define-clike-checker (name command modes)
;  `(flycheck-define-checker ,(intern (format "%s" name))
;     ,(format "A %s checker using %s" name (car command))
;     :command (,@command source-inplace)
;     :error-patterns
;     ((warning line-start (file-name) ":" line ":" column ": 警告:" (message) line-end)
;      (error line-start (file-name) ":" line ":" column ": エラー:" (message) line-end))
;     :modes ',modes))
;(flycheck-define-clike-checker c-gcc-ja
;			       ("gcc" "-fsyntax-only" "-Wall" "-Wextra")
;			       c-mode)
;(add-to-list 'flycheck-checkers 'c-gcc-ja)
;(flycheck-define-clike-checker c++-g++-ja
;			       ("g++" "-fsyntax-only" "-Wall" "-Wextra" "-std=c++11")
;			       c++-mode)
;(add-to-list 'flycheck-checkers 'c++-g++-ja)

