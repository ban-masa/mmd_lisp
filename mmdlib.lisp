(require 'cl-opengl)
(require 'cl-glut)
(require 'cl-glu)

(defun convert-to-float ((b '(unsigned-byte 32)))
  (let ((a (/ (+ (aref b 0) (ash (aref b 1) 8) (ash (logand #b01111111 (aref b 2)) 16)) (ash 1 23)))
        (b (+ (ash (aref b 2) -7) (ash (logand #b01111111 (aref b 3)) 1)))
        (c (ash (aref b 3) -7)))
    (float (* (expt -1 c) (expt 2 (- b 127)) (+ 1 a)))
    )
  )

(defclass vertex
  ((locate :accessor vertex-locate :initform (make-array 3))
   (normal :accessor vertex-normal :initform (make-array 3))
   (uv :accessor vertex-uv :initform (make-array 2))
   (ex-uv :accessor vertex-ex-uv)
   (weight-type :accessor vertex-weight-type)
   (bone-index :accessor vertex-bone-index :init-from (make-array 4))
   (sdef-c :accessor vertex-sdef-c :init-from (make-array 3))
   (sdef-r0 :accessor vertex-sdef-r0 :init-from (make-array 3))
   (sdef-r1 :accessor vertex-sdef-r1 :init-from (make-array 3))
   (edge-mag :accessor vertex-edge-mag)
   (ex-uv-num :accessor vertex-ex-uv-num)
   (id :accessor vertex-id)
   )
  )

(defmethod read-data ((v vertex))
  )


(defclass mmd-model ()
  (
   ))

(defmethod read-model ((self mmd-model) fname)
  )

(defmethod display ((self mmd-model))
  )

(defmethod texture-config ((self mmd-model))
  )
