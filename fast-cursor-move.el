(defun fast-cursor-move-forward-line()
  (interactive)
  (let (column)
    (setq column 'current-column)
    (forward-line 10)
    (foward-char 5)
    ))

(defun fast-cursor-move-backward-line()
  (interactive)
  (let (column)
    (setq column 'current-column)
    (forward-line -10)
    (foward-char column))
)


(global-set-key (kbd "C-S-n") 'fast-cursor-move-forward-line)
(global-set-key (kbd "C-S-p") 'fast-cursor-move-backward-line)
