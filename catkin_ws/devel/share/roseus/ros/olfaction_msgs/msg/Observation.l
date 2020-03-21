;; Auto-generated. Do not edit!


(when (boundp 'olfaction_msgs::Observation)
  (if (not (find-package "OLFACTION_MSGS"))
    (make-package "OLFACTION_MSGS"))
  (shadow 'Observation (find-package "OLFACTION_MSGS")))
(unless (find-package "OLFACTION_MSGS::OBSERVATION")
  (make-package "OLFACTION_MSGS::OBSERVATION"))

(in-package "ROS")
;;//! \htmlinclude Observation.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*TYPE_INVALID*" (find-package "OLFACTION_MSGS::OBSERVATION"))
(shadow '*TYPE_INVALID* (find-package "OLFACTION_MSGS::OBSERVATION"))
(defconstant olfaction_msgs::Observation::*TYPE_INVALID* 0)
(intern "*TYPE_GAS*" (find-package "OLFACTION_MSGS::OBSERVATION"))
(shadow '*TYPE_GAS* (find-package "OLFACTION_MSGS::OBSERVATION"))
(defconstant olfaction_msgs::Observation::*TYPE_GAS* 1)
(intern "*TYPE_WIND*" (find-package "OLFACTION_MSGS::OBSERVATION"))
(shadow '*TYPE_WIND* (find-package "OLFACTION_MSGS::OBSERVATION"))
(defconstant olfaction_msgs::Observation::*TYPE_WIND* 2)
(intern "*TYPE_GAS_WIND*" (find-package "OLFACTION_MSGS::OBSERVATION"))
(shadow '*TYPE_GAS_WIND* (find-package "OLFACTION_MSGS::OBSERVATION"))
(defconstant olfaction_msgs::Observation::*TYPE_GAS_WIND* 3)
(defclass olfaction_msgs::Observation
  :super ros::object
  :slots (_header _label _position _type _gas _wind ))

(defmethod olfaction_msgs::Observation
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:label __label) "")
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:type __type) 0)
    ((:gas __gas) 0.0)
    ((:wind __wind) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _label (string __label))
   (setq _position __position)
   (setq _type (round __type))
   (setq _gas (float __gas))
   (setq _wind __wind)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:gas
   (&optional __gas)
   (if __gas (setq _gas __gas)) _gas)
  (:wind
   (&rest __wind)
   (if (keywordp (car __wind))
       (send* _wind __wind)
     (progn
       (if __wind (setq _wind (car __wind)))
       _wind)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _label
    4 (length _label)
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; uint8 _type
    1
    ;; float32 _gas
    4
    ;; geometry_msgs/Vector3 _wind
    (send _wind :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; uint8 _type
       (write-byte _type s)
     ;; float32 _gas
       (sys::poke _gas (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3 _wind
       (send _wind :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _gas
     (setq _gas (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _wind
     (send _wind :deserialize buf ptr-) (incf ptr- (send _wind :serialization-length))
   ;;
   self)
  )

(setf (get olfaction_msgs::Observation :md5sum-) "69bade18f26a947c564210f213ae07bf")
(setf (get olfaction_msgs::Observation :datatype-) "olfaction_msgs/Observation")
(setf (get olfaction_msgs::Observation :definition-)
      "## TYPE
uint8 TYPE_INVALID=0
uint8 TYPE_GAS=1
uint8 TYPE_WIND=2
uint8 TYPE_GAS_WIND=3


## OBSERVATION
Header                  header          # timestamp, frame_id
string                  label           # optional sensor label
geometry_msgs/Point     position        # sensor pose with regard to frame_id
uint8                   type		# specify sensor type
float32                 gas             # gas reading
geometry_msgs/Vector3   wind            # wind vector




================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :olfaction_msgs/Observation "69bade18f26a947c564210f213ae07bf")


