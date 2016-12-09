;;; cmake-completion.el --- cmake completion         -*- lexical-binding: t; -*-

;; Copyright (C) 2016  rcmerci

;; Author: rcmerci <562837353@qq.com>
;; Keywords: languages, convenience
;; Package-Requires: ((emacs "24.4") (cmake-mode "20160928.505"))
;; Version: 20161209.1


;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:


(require 'cmake-mode)


(defvar cmake-completion//candidates (append
				     (cmake-get-list "command")
				     (cmake-get-list "variable")
				     (cmake-get-list "module")
				     (cmake-get-list "property"))
  "candidates for completion")

;;;###autoload
(defun cmake-completion//completion-function ()
  "cmake completion function, set `completion-at-point-functions' to it "
  (let* ((symbol (cmake-symbol-at-point))
	 (end (point)))
    (save-excursion
      (search-backward symbol)
      (let ((beg (point)))
	(list beg end cmake-completion//candidates :exclusive 'no)
	)
      )
    )
  )


;;;###autoload
(with-eval-after-load 'cmake-mode
  (add-hook 'cmake-mode-hook (lambda ()
			      (setq completion-at-point-functions #'cmake-completion//completion-function))))


(provide 'cmake-completion)
;;; cmake-completion.el ends here


