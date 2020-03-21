; Auto-generated. Do not edit!


(cl:in-package olfaction_msgs-msg)


;//! \htmlinclude Observation.msg.html

(cl:defclass <Observation> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (label
    :reader label
    :initarg :label
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (gas
    :reader gas
    :initarg :gas
    :type cl:float
    :initform 0.0)
   (wind
    :reader wind
    :initarg :wind
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass Observation (<Observation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Observation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Observation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name olfaction_msgs-msg:<Observation> is deprecated: use olfaction_msgs-msg:Observation instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:header-val is deprecated.  Use olfaction_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:label-val is deprecated.  Use olfaction_msgs-msg:label instead.")
  (label m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:position-val is deprecated.  Use olfaction_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:type-val is deprecated.  Use olfaction_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'gas-val :lambda-list '(m))
(cl:defmethod gas-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:gas-val is deprecated.  Use olfaction_msgs-msg:gas instead.")
  (gas m))

(cl:ensure-generic-function 'wind-val :lambda-list '(m))
(cl:defmethod wind-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:wind-val is deprecated.  Use olfaction_msgs-msg:wind instead.")
  (wind m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Observation>)))
    "Constants for message type '<Observation>"
  '((:TYPE_INVALID . 0)
    (:TYPE_GAS . 1)
    (:TYPE_WIND . 2)
    (:TYPE_GAS_WIND . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Observation)))
    "Constants for message type 'Observation"
  '((:TYPE_INVALID . 0)
    (:TYPE_GAS . 1)
    (:TYPE_WIND . 2)
    (:TYPE_GAS_WIND . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Observation>) ostream)
  "Serializes a message object of type '<Observation>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gas))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'wind) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Observation>) istream)
  "Deserializes a message object of type '<Observation>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gas) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'wind) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Observation>)))
  "Returns string type for a message object of type '<Observation>"
  "olfaction_msgs/Observation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Observation)))
  "Returns string type for a message object of type 'Observation"
  "olfaction_msgs/Observation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Observation>)))
  "Returns md5sum for a message object of type '<Observation>"
  "69bade18f26a947c564210f213ae07bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Observation)))
  "Returns md5sum for a message object of type 'Observation"
  "69bade18f26a947c564210f213ae07bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Observation>)))
  "Returns full string definition for message of type '<Observation>"
  (cl:format cl:nil "## TYPE~%uint8 TYPE_INVALID=0~%uint8 TYPE_GAS=1~%uint8 TYPE_WIND=2~%uint8 TYPE_GAS_WIND=3~%~%~%## OBSERVATION~%Header                  header          # timestamp, frame_id~%string                  label           # optional sensor label~%geometry_msgs/Point     position        # sensor pose with regard to frame_id~%uint8                   type		# specify sensor type~%float32                 gas             # gas reading~%geometry_msgs/Vector3   wind            # wind vector~%~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Observation)))
  "Returns full string definition for message of type 'Observation"
  (cl:format cl:nil "## TYPE~%uint8 TYPE_INVALID=0~%uint8 TYPE_GAS=1~%uint8 TYPE_WIND=2~%uint8 TYPE_GAS_WIND=3~%~%~%## OBSERVATION~%Header                  header          # timestamp, frame_id~%string                  label           # optional sensor label~%geometry_msgs/Point     position        # sensor pose with regard to frame_id~%uint8                   type		# specify sensor type~%float32                 gas             # gas reading~%geometry_msgs/Vector3   wind            # wind vector~%~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Observation>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'label))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     1
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'wind))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Observation>))
  "Converts a ROS message object to a list"
  (cl:list 'Observation
    (cl:cons ':header (header msg))
    (cl:cons ':label (label msg))
    (cl:cons ':position (position msg))
    (cl:cons ':type (type msg))
    (cl:cons ':gas (gas msg))
    (cl:cons ':wind (wind msg))
))
