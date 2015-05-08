;; The MIT License (MIT)

;; Copyright (c) Google Inc. All Rights Reserved
;;
;; author: Mark T. Tomczak (mtomczak@google.com)

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

(require 'cl)
(require 'url)

(defgroup elementor nil "Customization variables for the elementor connector.")
(defcustom elementor-server "http://localhost:13000"
  "Address to use to connect to the webdriver server running elementor."
  :group 'elementor
  :type 'string)

(defun elementor-call-in-region (start end)
  "Sends the text in the region as a command to Elementor."
  (interactive "r")
  (elementor--call (buffer-substring-no-properties start end)))

(defun elementor--call (cmd)
  "Sends cmd to the Elementor server."
  (url-retrieve (concat elementor-server "/testSelector?popupInput=" cmd)
                'elementor--show-result))

(defun elementor--show-result (status)
  "Show the result buffer of the elmentor call."
  (switch-to-buffer (current-buffer)))

(provide 'elementor)
