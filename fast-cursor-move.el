(defun fast-cursor-move-forward-line()
  (interactive)
  (let (column)
    (setq column (current-column))
    (forward-line 10)
    (move-to-column column)
    ))

(defun fast-cursor-move-backward-line()
  (interactive)
  (let (column)
    (setq column (current-column))
    (forward-line -10)
    (move-to-column column))
)


(global-set-key (kbd "C-S-n") 'fast-cursor-move-forward-line)
(global-set-key (kbd "C-S-p") 'fast-cursor-move-backward-line)
