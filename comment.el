;; �����������ؿ������
(defun insert-big-comment ()
  (interactive)
  (insert-comment 77))

;; �����������ؿ��ʾ���
(defun insert-small-comment ()
  (interactive)
  (insert-comment 3))

;; �����������ؿ�
(defun insert-comment (number)
  (setq comment-string (read-string "�����Ȥ�ʸ�� : "))
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

;; �����Х���ɤ����
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
