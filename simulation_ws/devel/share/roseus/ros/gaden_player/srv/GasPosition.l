;; Auto-generated. Do not edit!


(when (boundp 'gaden_player::GasPosition)
  (if (not (find-package "GADEN_PLAYER"))
    (make-package "GADEN_PLAYER"))
  (shadow 'GasPosition (find-package "GADEN_PLAYER")))
(unless (find-package "GADEN_PLAYER::GASPOSITION")
  (make-package "GADEN_PLAYER::GASPOSITION"))
(unless (find-package "GADEN_PLAYER::GASPOSITIONREQUEST")
  (make-package "GADEN_PLAYER::GASPOSITIONREQUEST"))
(unless (find-package "GADEN_PLAYER::GASPOSITIONRESPONSE")
  (make-package "GADEN_PLAYER::GASPOSITIONRESPONSE"))

(in-package "ROS")





(defclass gaden_player::GasPositionRequest
  :super ros::object
  :slots (_x _y _z ))

(defmethod gaden_player::GasPositionRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass gaden_player::GasPositionResponse
  :super ros::object
  :slots (_gas_conc _gas_type ))

(defmethod gaden_player::GasPositionResponse
  (:init
   (&key
    ((:gas_conc __gas_conc) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:gas_type __gas_type) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _gas_conc __gas_conc)
   (setq _gas_type __gas_type)
   self)
  (:gas_conc
   (&optional __gas_conc)
   (if __gas_conc (setq _gas_conc __gas_conc)) _gas_conc)
  (:gas_type
   (&optional __gas_type)
   (if __gas_type (setq _gas_type __gas_type)) _gas_type)
  (:serialization-length
   ()
   (+
    ;; float64[] _gas_conc
    (* 8    (length _gas_conc)) 4
    ;; string[] _gas_type
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _gas_type)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _gas_conc
     (write-long (length _gas_conc) s)
     (dotimes (i (length _gas_conc))
       (sys::poke (elt _gas_conc i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string[] _gas_type
     (write-long (length _gas_type) s)
     (dolist (elem _gas_type)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _gas_conc
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gas_conc (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gas_conc i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; string[] _gas_type
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gas_type (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _gas_type i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass gaden_player::GasPosition
  :super ros::object
  :slots ())

(setf (get gaden_player::GasPosition :md5sum-) "a31b6d25f795275d0b32473395891f52")
(setf (get gaden_player::GasPosition :datatype-) "gaden_player/GasPosition")
(setf (get gaden_player::GasPosition :request) gaden_player::GasPositionRequest)
(setf (get gaden_player::GasPosition :response) gaden_player::GasPositionResponse)

(defmethod gaden_player::GasPositionRequest
  (:response () (instance gaden_player::GasPositionResponse :init)))

(setf (get gaden_player::GasPositionRequest :md5sum-) "a31b6d25f795275d0b32473395891f52")
(setf (get gaden_player::GasPositionRequest :datatype-) "gaden_player/GasPositionRequest")
(setf (get gaden_player::GasPositionRequest :definition-)
      "float64 x
float64 y
float64 z
---
float64[] gas_conc
string[] gas_type

")

(setf (get gaden_player::GasPositionResponse :md5sum-) "a31b6d25f795275d0b32473395891f52")
(setf (get gaden_player::GasPositionResponse :datatype-) "gaden_player/GasPositionResponse")
(setf (get gaden_player::GasPositionResponse :definition-)
      "float64 x
float64 y
float64 z
---
float64[] gas_conc
string[] gas_type

")



(provide :gaden_player/GasPosition "a31b6d25f795275d0b32473395891f52")


