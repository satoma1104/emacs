;; ���ܸ�Ķ��ˤ���
;(set-language-environment "Japanese")

;(prefer-coding-system 'utf-8-unix)	; ���ܸ����ϤΤ��������
(set-default-coding-systems 'utf-8-dos) 
;(setq default-file-name-coding-system 'shift_jis) ;dired�����ܸ�file̾����
(setq default-file-name-coding-system 'utf-8-dos) ;dired�����ܸ�file̾����

;; ʸ�������ǥ��󥰤�EUC�ˤ���
;(set-default-coding-systems 'euc-jp)
;(set-buffer-file-coding-system 'euc-jp-unix)
;(set-terminal-coding-system 'euc-jp)
;(set-keyboard-coding-system 'euc-jp)

;;*****************************************************************************
;; anthy�ط�������
;;*****************************************************************************

; anthy.el ����ɤǤ���褦�ˤ��� (ɬ�פ˱�����)��
(push "/usr/local/share/emacs/site-lisp/anthy/" load-path)

; anthy.el ����ɤ��롣
(load-library "anthy")
;(load-file "/usr/share/emacs/24.5/lisp/leim/leim-list.el")
(load-file "/usr/share/emacs/site-lisp/anthy/leim-list.el")

; japanese-anthy ��ǥե���Ȥ� input-method �ˤ��롣
(setq default-input-method "japanese-anthy")

; �Ѵ�����ʸ���ο�
(set-face-foreground 'anthy-highlight-face "white")

; �Ѵ������طʤο�
(set-face-background 'anthy-underline-face "indian red")
(set-face-background 'anthy-highlight-face "maroon")

; ��������饤��õ�
(set-face-underline 'anthy-highlight-face nil)
(set-face-underline 'anthy-underline-face nil)

; ���Ϥ��Ѵ����ʤ����٤����ݤ�����������
(if (>= emacs-major-version 22)
    (setq anthy-accept-timeout 1))


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
