;; Auto-generated. Do not edit!


(when (boundp 'gaden_player::WindPosition)
  (if (not (find-package "GADEN_PLAYER"))
    (make-package "GADEN_PLAYER"))
  (shadow 'WindPosition (find-package "GADEN_PLAYER")))
(unless (find-package "GADEN_PLAYER::WINDPOSITION")
  (make-package "GADEN_PLAYER::WINDPOSITION"))
(unless (find-package "GADEN_PLAYER::WINDPOSITIONREQUEST")
  (make-package "GADEN_PLAYER::WINDPOSITIONREQUEST"))
(unless (find-package "GADEN_PLAYER::WINDPOSITIONRESPONSE")
  (make-package "GADEN_PLAYER::WINDPOSITIONRESPONSE"))

(in-package "ROS")





(defclass gaden_player::WindPositionRequest
  :super ros::object
  :slots (_x _y _z ))

(defmethod gaden_player::WindPositionRequest
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

(defclass gaden_player::WindPositionResponse
  :super ros::object
  :slots (_u _v _w ))

(defmethod gaden_player::WindPositionResponse
  (:init
   (&key
    ((:u __u) 0.0)
    ((:v __v) 0.0)
    ((:w __w) 0.0)
    )
   (send-super :init)
   (setq _u (float __u))
   (setq _v (float __v))
   (setq _w (float __w))
   self)
  (:u
   (&optional __u)
   (if __u (setq _u __u)) _u)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:serialization-length
   ()
   (+
    ;; float64 _u
    8
    ;; float64 _v
    8
    ;; float64 _w
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _u
       (sys::poke _u (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v
       (sys::poke _v (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _u
     (setq _u (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v
     (setq _v (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass gaden_player::WindPosition
  :super ros::object
  :slots ())

(setf (get gaden_player::WindPosition :md5sum-) "c7d239bda793d989e4c3fa81d8d2b731")
(setf (get gaden_player::WindPosition :datatype-) "gaden_player/WindPosition")
(setf (get gaden_player::WindPosition :request) gaden_player::WindPositionRequest)
(setf (get gaden_player::WindPosition :response) gaden_player::WindPositionResponse)

(defmethod gaden_player::WindPositionRequest
  (:response () (instance gaden_player::WindPositionResponse :init)))

(setf (get gaden_player::WindPositionRequest :md5sum-) "c7d239bda793d989e4c3fa81d8d2b731")
(setf (get gaden_player::WindPositionRequest :datatype-) "gaden_player/WindPositionRequest")
(setf (get gaden_player::WindPositionRequest :definition-)
      "float64 x
float64 y
float64 z
---
float64 u
float64 v
float64 w

")

(setf (get gaden_player::WindPositionResponse :md5sum-) "c7d239bda793d989e4c3fa81d8d2b731")
(setf (get gaden_player::WindPositionResponse :datatype-) "gaden_player/WindPositionResponse")
(setf (get gaden_player::WindPositionResponse :definition-)
      "float64 x
float64 y
float64 z
---
float64 u
float64 v
float64 w

")



(provide :gaden_player/WindPosition "c7d239bda793d989e4c3fa81d8d2b731")


