(defun open-my-init-file()
  "Open my init file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun kill-other-buffers()
  "Kill all buffers without current buffer."
  (interactive)
  (delete-other-windows)
  (let ((current (buffer-name)))
    (mapcar 'kill-buffer (cdr (buffer-list)))))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

(defun run-java-main (filename)
  "Compile and run java file"
  (let ((output-buffer "*Java Output*")
        (filename (format "%s" filename)))
    (if (equal (shell-command (format "javac -d . -encoding %s %s" "utf-8" filename) output-buffer output-buffer) 0)
        (async-shell-command (format "java %s" (car (split-string filename "\\."))) output-buffer output-buffer)
    (progn (switch-to-buffer-other-window output-buffer)
           (messages-buffer-mode)))))

(defun run-java-main-currently-buffer ()
  "Compile and run java file use current buffer name"
  (interactive)
  (if (buffer-modified-p (current-buffer))
      (save-buffer))
  (run-java-main (current-buffer)))

(provide 'init-functions)
