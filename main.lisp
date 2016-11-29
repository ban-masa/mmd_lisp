(load "mmdlib.lisp")

(defvar *width* 500)
(defvar *height* 500)
(defvar *cnt* 0)

(setq *model* (make-instance 'mmd-model))
(defun user-display ()
  (gl:color 0 0 0 0)
  (gl:rotate 1 0 1 0)
  (gl:point-size 1)
  (display *model*)
  )

(defun user-init ()
  (read-model *model* "紫電改改一.pmx"))

(defun user-idle ()
  (sleep (/ 1.0 60.0)))

(defclass main-window (glut:window) ()
  (:default-initargs :title "opengl test" :mode '(:double :rgb :depth) :width *width* :height *height*))

(defmethod glut:display ((window main-window))
  (gl:clear :color-buffer-bit :depth-buffer-bit)
  (user-display)
  (glut:swap-buffers)
  (gl:flush))

(defmethod glut:idle ((window main-window))
  (user-idle)
  (glut:post-redisplay))

(defmethod glut:reshape ((w main-window) width height)
  (gl:matrix-mode :projection)
  (gl:viewport 0 0 width height)
  (gl:load-identity)
  (glu:perspective 30 (/ (float width) (float height)) 1.0 500.0)
  (glu:look-at 0 10 300 0 10 -10 0 1 0)
  (gl:matrix-mode :modelview)
  (gl:load-identity)
;;  (gl:ortho -50 50 50 -50 -50 100)
  )

(defmethod glut:display-window :before ((window main-window))
  (gl:clear-color 1.0 1.0 1.0 1.0))

(defun main ()
  (user-init)
  (glut:display-window (make-instance 'main-window)))
