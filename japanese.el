;;*****************************************************************************
;; anthy�ط�������
;;*****************************************************************************

; anthy.el ����ɤ��롣
(load-library "anthy")
(load-file "/usr/share/emacs/site-lisp/anthy/leim-list.el")

; �Ѵ�����ʸ���ο�
(set-face-foreground 'anthy-highlight-face "white")

; �Ѵ������طʤο�
(set-face-background 'anthy-underline-face "indian red")
(set-face-background 'anthy-highlight-face "maroon")

; ��������饤��õ�
(set-face-underline 'anthy-highlight-face nil)
(set-face-underline 'anthy-underline-face nil)


;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)

;; C-SPC �� Set Mark �˻Ȥ�
;(ibus-define-common-key ?\C-\s nil)
;; C-/ �� Undo �˻Ȥ�
;(ibus-define-common-key ?\C-/ nil)
;; IBus�ξ��֤ˤ�äƥ������뿧���Ѳ�������
;(setq ibus-cursor-color '("red" "blue" "limegreen"))
;; C-j ��Ⱦ�ѱѿ��⡼�ɤ�ȥ��뤹��
;(ibus-define-common-key ?\C-j t)

;(ibus-define-common-key 'C-henkan t)


;; Keybindings
;(global-set-key (kbd "C-\\") 'ibus-toggle)
;(global-set-key (kbd "M-o") (lambda () (interactive) (ibus-enable "m17n:sa:vz-prefix")))
;(global-set-key (kbd "C-o") (lambda () (interactive) (ibus-enable "mozc-jp")))
;(global-set-key (kbd "C-<f7>")
;                (lambda ()
;                  (interactive)
;                  (shell-command-to-string
;                   "/usr/lib/mozc/mozc_tool --mode=word_register_dialog")))
