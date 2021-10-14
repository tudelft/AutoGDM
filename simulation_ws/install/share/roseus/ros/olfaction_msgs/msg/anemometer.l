;; Auto-generated. Do not edit!


(when (boundp 'olfaction_msgs::anemometer)
  (if (not (find-package "OLFACTION_MSGS"))
    (make-package "OLFACTION_MSGS"))
  (shadow 'anemometer (find-package "OLFACTION_MSGS")))
(unless (find-package "OLFACTION_MSGS::ANEMOMETER")
  (make-package "OLFACTION_MSGS::ANEMOMETER"))

(in-package "ROS")
;;//! \htmlinclude anemometer.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass olfaction_msgs::anemometer
  :super ros::object
  :slots (_header _sensor_label _wind_speed _wind_direction ))

(defmethod olfaction_msgs::anemometer
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensor_label __sensor_label) "")
    ((:wind_speed __wind_speed) 0.0)
    ((:wind_direction __wind_direction) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensor_label (string __sensor_label))
   (setq _wind_speed (float __wind_speed))
   (setq _wind_direction (float __wind_direction))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sensor_label
   (&optional __sensor_label)
   (if __sensor_label (setq _sensor_label __sensor_label)) _sensor_label)
  (:wind_speed
   (&optional __wind_speed)
   (if __wind_speed (setq _wind_speed __wind_speed)) _wind_speed)
  (:wind_direction
   (&optional __wind_direction)
   (if __wind_direction (setq _wind_direction __wind_direction)) _wind_direction)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _sensor_label
    4 (length _sensor_label)
    ;; float32 _wind_speed
    4
    ;; float32 _wind_direction
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _sensor_label
       (write-long (length _sensor_label) s) (princ _sensor_label s)
     ;; float32 _wind_speed
       (sys::poke _wind_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wind_direction
       (sys::poke _wind_direction (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _sensor_label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sensor_label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _wind_speed
     (setq _wind_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wind_direction
     (setq _wind_direction (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get olfaction_msgs::anemometer :md5sum-) "a6eda3f54da66470bd27452be26d76e3")
(setf (get olfaction_msgs::anemometer :datatype-) "olfaction_msgs/anemometer")
(setf (get olfaction_msgs::anemometer :definition-)
      "Header header		    #timestamp, frame_id

string sensor_label	    #identifier
float32 wind_speed	    #m/s
float32 wind_direction	#rad

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

")



(provide :olfaction_msgs/anemometer "a6eda3f54da66470bd27452be26d76e3")


