; Auto-generated. Do not edit!


(cl:in-package olfaction_msgs-msg)


;//! \htmlinclude anemometer.msg.html

(cl:defclass <anemometer> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensor_label
    :reader sensor_label
    :initarg :sensor_label
    :type cl:string
    :initform "")
   (wind_speed
    :reader wind_speed
    :initarg :wind_speed
    :type cl:float
    :initform 0.0)
   (wind_direction
    :reader wind_direction
    :initarg :wind_direction
    :type cl:float
    :initform 0.0))
)

(cl:defclass anemometer (<anemometer>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <anemometer>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'anemometer)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name olfaction_msgs-msg:<anemometer> is deprecated: use olfaction_msgs-msg:anemometer instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <anemometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:header-val is deprecated.  Use olfaction_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensor_label-val :lambda-list '(m))
(cl:defmethod sensor_label-val ((m <anemometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:sensor_label-val is deprecated.  Use olfaction_msgs-msg:sensor_label instead.")
  (sensor_label m))

(cl:ensure-generic-function 'wind_speed-val :lambda-list '(m))
(cl:defmethod wind_speed-val ((m <anemometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:wind_speed-val is deprecated.  Use olfaction_msgs-msg:wind_speed instead.")
  (wind_speed m))

(cl:ensure-generic-function 'wind_direction-val :lambda-list '(m))
(cl:defmethod wind_direction-val ((m <anemometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:wind_direction-val is deprecated.  Use olfaction_msgs-msg:wind_direction instead.")
  (wind_direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <anemometer>) ostream)
  "Serializes a message object of type '<anemometer>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sensor_label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sensor_label))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wind_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wind_direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <anemometer>) istream)
  "Deserializes a message object of type '<anemometer>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor_label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sensor_label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wind_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wind_direction) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<anemometer>)))
  "Returns string type for a message object of type '<anemometer>"
  "olfaction_msgs/anemometer")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'anemometer)))
  "Returns string type for a message object of type 'anemometer"
  "olfaction_msgs/anemometer")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<anemometer>)))
  "Returns md5sum for a message object of type '<anemometer>"
  "a6eda3f54da66470bd27452be26d76e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'anemometer)))
  "Returns md5sum for a message object of type 'anemometer"
  "a6eda3f54da66470bd27452be26d76e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<anemometer>)))
  "Returns full string definition for message of type '<anemometer>"
  (cl:format cl:nil "Header header		    #timestamp, frame_id~%~%string sensor_label	    #identifier~%float32 wind_speed	    #m/s~%float32 wind_direction	#rad~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'anemometer)))
  "Returns full string definition for message of type 'anemometer"
  (cl:format cl:nil "Header header		    #timestamp, frame_id~%~%string sensor_label	    #identifier~%float32 wind_speed	    #m/s~%float32 wind_direction	#rad~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <anemometer>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'sensor_label))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <anemometer>))
  "Converts a ROS message object to a list"
  (cl:list 'anemometer
    (cl:cons ':header (header msg))
    (cl:cons ':sensor_label (sensor_label msg))
    (cl:cons ':wind_speed (wind_speed msg))
    (cl:cons ':wind_direction (wind_direction msg))
))
