;;; build.el --- Minimal emacs installation to build the website -*- lexical-binding: t -*-
;; Based on the one from Bruno Henirques: https://github.com/bphenriques/knowledge-base/blob/8fb31838fd3f682d602eeb269ee7d92eecbbb8dc/tools/init.el
;;
;;; Commentary:
;;; - Requires KNOWLEDGE_BASE_ORG_SOURCE environment variable
;;; Code:

(require 'subr-x)

(toggle-debug-on-error)      ;; Show debug informaton as soon as error occurs.
(setq make-backup-files nil) ;; Disable "<file>~" backups.

(defconst knowledge-base-org-files
  (let* ((env-key "KNOWLEDGE_BASE_ORG_SRC")
         (env-value (getenv env-key)))
    (if (and env-value (file-directory-p env-value))
        env-value
      (error (format "%s is not set or is not an existing directory (%s)" env-key env-value)))))

;; Setup packages using straight.el: https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)
(straight-use-package 'use-package)

(use-package ox-hugo
  :straight (:type git :host github :repo "kaushalmodi/ox-hugo"))

;;; Public functions
(defun build/export-all ()
  "Export all org-files (including nested) under knowledge-base-org-files."

  (setq org-hugo-base-dir
    (let* ((env-key "HUGO_BASE_DIR")
           (env-value (getenv env-key)))
      (if (and env-value (file-directory-p env-value))
          env-value
        (error (format "%s is not set or is not an existing directory (%s)" env-key env-value)))))

  (dolist (org-file (directory-files-recursively knowledge-base-org-files "\.org$"))
    (with-current-buffer (find-file org-file)
      (message (format "[build] Exporting %s" org-file))
      (org-hugo-export-wim-to-md :all-subtrees nil nil nil)))

  (message "Done!"))

(provide 'build/export-all)

;;; init.el ends here
