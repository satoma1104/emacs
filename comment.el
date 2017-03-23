;; コメント挿入関数（大）
(defun insert-big-comment ()
  (interactive)
  (insert-comment 77))

;; コメント挿入関数（小）
(defun insert-small-comment ()
  (interactive)
  (insert-comment 3))

;; コメント挿入関数
(defun insert-comment (number)
  (setq comment-string (read-string "コメントの文章 : "))
  (setq comment-line "//")
  (let ((count number))
    (while (> count 0)
      (setq comment-line (concat comment-line "-"))
      (setq count (- count 1))))
  (setq comment-line (concat comment-line "\n"))
  (let ((start (point)))
    (insert comment-line)
    (insert "// " comment-string "\n")
    (insert comment-line)
    (insert "*")
    (c-indent-region start (point)))
  (delete-backward-char 1))

;; キーバインドの定義
(add-hook 'c-mode-hook
	  '(lambda ()
	     (define-key c-mode-map "\C-ccb" 'insert-big-comment)
	     (define-key c-mode-map "\C-ccs" 'insert-small-comment)
	     ))

(add-hook 'c++-mode-hook
	  '(lambda ()
	     (define-key c++-mode-map "\C-ccb" 'insert-big-comment)
	     (define-key c++-mode-map "\C-ccs" 'insert-small-comment)
	     ))
