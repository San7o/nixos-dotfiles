;; Zerodark theme
(load-theme 'zerodark t)
(zerodark-setup-modeline-format)

;; git
(require 'git)

;; Evil
(require 'evil)
(evil-mode 1)

;; Consult
(require 'consult)

;; Orderless - Required by Affe
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

;; Affe - code fuzzer
(require 'affe)
(defun affe-orderless-regexp-compiler (input _type _ignorecase)
  (setq input (cdr (orderless-compile input)))
  (cons input (apply-partially #'orderless--highlight input t)))
(setq affe-regexp-compiler #'affe-orderless-regexp-compiler)


;; Customization
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-time-mode 1)
(setq display-time-format "%I:%M")
(setq display-battery-mode 1)

;; Exwm
(require 'exwm)
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 5)

  ;; When window "class" updates, use it to set the buffer name
  ;; (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)

  ;; These keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-u
      ?\C-h
      ?\M-x
      ?\M-`
      ?\M-&
      ?\M-:
      ?\C-\M-j  ;; Buffer list
      ?\C-\ ))  ;; Ctrl+Space

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

          ;; Move between windows
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-down)

          ;; Launch applications via shell command
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))

          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)

          ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))

          ;; Audio keys
          ([XF86AudioRaiseVolume] . (lambda ()
				      (interactive)
				      (shell-command "amixer -D pipewire sset Master 5%+")))
          ([XF86AudioLowerVolume] . (lambda ()
				      (interactive)
				      (shell-command "amixer -D pipewire sset Master 5%-")))
	   
          ([XF86AudioMute] . (lambda()
			       (interactive)
			       (shell-command "amixer -D pipewire sset Master toggle")))
          ([XF86AudioMicMute] . (lambda()
				   (interactive)
				   (shell-command "amixer -D pipewire sset Master toggle")))
          ;; Brightness
          ([XF86MonBrightnessUp] . (lambda()
				   (interactive)
				   (shell-command "brightnessctl s +5%")))
          ([XF86MonBrightnessDown] . (lambda()
				   (interactive)
				   (shell-command "brightnessctl s 5%-")))
      ))

  (exwm-enable)
