(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(setq package-list
      '(
        color-theme-solarized
        ein
        elpy
        flycheck
        magit
        magit-lfs
        protobuf-mode
        pylint
        python-docstring
        python-mode
        yaml-mode
        yapfify
))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
