; Auto-generated. Do not edit!


(cl:in-package olfaction_msgs-msg)


;//! \htmlinclude gas_sensor.msg.html

(cl:defclass <gas_sensor> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (technology
    :reader technology
    :initarg :technology
    :type cl:fixnum
    :initform 0)
   (manufacturer
    :reader manufacturer
    :initarg :manufacturer
    :type cl:fixnum
    :initform 0)
   (mpn
    :reader mpn
    :initarg :mpn
    :type cl:fixnum
    :initform 0)
   (raw
    :reader raw
    :initarg :raw
    :type cl:float
    :initform 0.0)
   (raw_units
    :reader raw_units
    :initarg :raw_units
    :type cl:fixnum
    :initform 0)
   (raw_air
    :reader raw_air
    :initarg :raw_air
    :type cl:float
    :initform 0.0)
   (calib_A
    :reader calib_A
    :initarg :calib_A
    :type cl:float
    :initform 0.0)
   (calib_B
    :reader calib_B
    :initarg :calib_B
    :type cl:float
    :initform 0.0))
)

(cl:defclass gas_sensor (<gas_sensor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gas_sensor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gas_sensor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name olfaction_msgs-msg:<gas_sensor> is deprecated: use olfaction_msgs-msg:gas_sensor instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:header-val is deprecated.  Use olfaction_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'technology-val :lambda-list '(m))
(cl:defmethod technology-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:technology-val is deprecated.  Use olfaction_msgs-msg:technology instead.")
  (technology m))

(cl:ensure-generic-function 'manufacturer-val :lambda-list '(m))
(cl:defmethod manufacturer-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:manufacturer-val is deprecated.  Use olfaction_msgs-msg:manufacturer instead.")
  (manufacturer m))

(cl:ensure-generic-function 'mpn-val :lambda-list '(m))
(cl:defmethod mpn-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:mpn-val is deprecated.  Use olfaction_msgs-msg:mpn instead.")
  (mpn m))

(cl:ensure-generic-function 'raw-val :lambda-list '(m))
(cl:defmethod raw-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:raw-val is deprecated.  Use olfaction_msgs-msg:raw instead.")
  (raw m))

(cl:ensure-generic-function 'raw_units-val :lambda-list '(m))
(cl:defmethod raw_units-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:raw_units-val is deprecated.  Use olfaction_msgs-msg:raw_units instead.")
  (raw_units m))

(cl:ensure-generic-function 'raw_air-val :lambda-list '(m))
(cl:defmethod raw_air-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:raw_air-val is deprecated.  Use olfaction_msgs-msg:raw_air instead.")
  (raw_air m))

(cl:ensure-generic-function 'calib_A-val :lambda-list '(m))
(cl:defmethod calib_A-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:calib_A-val is deprecated.  Use olfaction_msgs-msg:calib_A instead.")
  (calib_A m))

(cl:ensure-generic-function 'calib_B-val :lambda-list '(m))
(cl:defmethod calib_B-val ((m <gas_sensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:calib_B-val is deprecated.  Use olfaction_msgs-msg:calib_B instead.")
  (calib_B m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<gas_sensor>)))
    "Constants for message type '<gas_sensor>"
  '((:TECH_UNKNOWN . 0)
    (:TECH_MOX . 1)
    (:TECH_AEC . 2)
    (:TECH_EQ . 50)
    (:TECH_PID . 51)
    (:TECH_SAW . 52)
    (:TECH_TEMP . 100)
    (:TECH_HUMIDITY . 101)
    (:TECH_NOT_VALID . 255)
    (:MANU_UNKNOWN . 0)
    (:MANU_FIGARO . 1)
    (:MANU_ALPHASENSE . 2)
    (:MANU_SGX . 3)
    (:MANU_RAE . 50)
    (:MANU_HANWEI . 51)
    (:MANU_NOT_VALID . 255)
    (:MPN_UNKNOWN . 0)
    (:MPN_TGS2620 . 50)
    (:MPN_TGS2600 . 51)
    (:MPN_TGS2611 . 52)
    (:MPN_TGS2610 . 53)
    (:MPN_TGS2612 . 54)
    (:MPN_MINIRAELITE . 70)
    (:MPN_NOT_VALID . 255)
    (:UNITS_UNKNOWN . 0)
    (:UNITS_VOLT . 1)
    (:UNITS_AMP . 2)
    (:UNITS_PPM . 3)
    (:UNITS_PPB . 4)
    (:UNITS_OHM . 5)
    (:UNITS_CENTIGRADE . 100)
    (:UNITS_RELATIVEHUMIDITY . 101)
    (:UNITS_NOT_VALID . 255))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'gas_sensor)))
    "Constants for message type 'gas_sensor"
  '((:TECH_UNKNOWN . 0)
    (:TECH_MOX . 1)
    (:TECH_AEC . 2)
    (:TECH_EQ . 50)
    (:TECH_PID . 51)
    (:TECH_SAW . 52)
    (:TECH_TEMP . 100)
    (:TECH_HUMIDITY . 101)
    (:TECH_NOT_VALID . 255)
    (:MANU_UNKNOWN . 0)
    (:MANU_FIGARO . 1)
    (:MANU_ALPHASENSE . 2)
    (:MANU_SGX . 3)
    (:MANU_RAE . 50)
    (:MANU_HANWEI . 51)
    (:MANU_NOT_VALID . 255)
    (:MPN_UNKNOWN . 0)
    (:MPN_TGS2620 . 50)
    (:MPN_TGS2600 . 51)
    (:MPN_TGS2611 . 52)
    (:MPN_TGS2610 . 53)
    (:MPN_TGS2612 . 54)
    (:MPN_MINIRAELITE . 70)
    (:MPN_NOT_VALID . 255)
    (:UNITS_UNKNOWN . 0)
    (:UNITS_VOLT . 1)
    (:UNITS_AMP . 2)
    (:UNITS_PPM . 3)
    (:UNITS_PPB . 4)
    (:UNITS_OHM . 5)
    (:UNITS_CENTIGRADE . 100)
    (:UNITS_RELATIVEHUMIDITY . 101)
    (:UNITS_NOT_VALID . 255))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gas_sensor>) ostream)
  "Serializes a message object of type '<gas_sensor>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'technology)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'manufacturer)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mpn)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'raw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'raw_units)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'raw_air))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'calib_A))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'calib_B))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gas_sensor>) istream)
  "Deserializes a message object of type '<gas_sensor>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'technology)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'manufacturer)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mpn)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'raw) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'raw_units)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'raw_air) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'calib_A) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'calib_B) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gas_sensor>)))
  "Returns string type for a message object of type '<gas_sensor>"
  "olfaction_msgs/gas_sensor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gas_sensor)))
  "Returns string type for a message object of type 'gas_sensor"
  "olfaction_msgs/gas_sensor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gas_sensor>)))
  "Returns md5sum for a message object of type '<gas_sensor>"
  "f19a4378539410bc0da063e4424de564")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gas_sensor)))
  "Returns md5sum for a message object of type 'gas_sensor"
  "f19a4378539410bc0da063e4424de564")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gas_sensor>)))
  "Returns full string definition for message of type '<gas_sensor>"
  (cl:format cl:nil "# Generic gas sensor msg~%~%# TECHNOLOGY -------------------------------------------------------------------~%uint8 TECH_UNKNOWN   = 0~%uint8 TECH_MOX       = 1~%uint8 TECH_AEC       = 2~%uint8 TECH_EQ        = 50~%uint8 TECH_PID       = 51~%uint8 TECH_SAW       = 52~%uint8 TECH_TEMP      = 100~%uint8 TECH_HUMIDITY  = 101~%uint8 TECH_NOT_VALID = 255~%~%~%# MANUFACTURER -----------------------------------------------------------------~%uint8 MANU_UNKNOWN   = 0~%uint8 MANU_FIGARO    = 1~%uint8 MANU_ALPHASENSE= 2~%uint8 MANU_SGX       = 3~%uint8 MANU_RAE       = 50~%uint8 MANU_HANWEI    = 51~%uint8 MANU_NOT_VALID = 255~%~%~%~%# MPN --------------------------------------------------------------------------~%uint8 MPN_UNKNOWN    = 0~%uint8 MPN_TGS2620    = 50~%uint8 MPN_TGS2600    = 51~%uint8 MPN_TGS2611    = 52~%uint8 MPN_TGS2610    = 53~%uint8 MPN_TGS2612    = 54~%uint8 MPN_MINIRAELITE= 70~%uint8 MPN_NOT_VALID  = 255~%~%~%~%# UNITS ------------------------------------------------------------------------~%uint8 UNITS_UNKNOWN          = 0~%uint8 UNITS_VOLT             = 1~%uint8 UNITS_AMP              = 2~%uint8 UNITS_PPM              = 3~%uint8 UNITS_PPB              = 4~%uint8 UNITS_OHM              = 5~%uint8 UNITS_CENTIGRADE       = 100~%uint8 UNITS_RELATIVEHUMIDITY = 101~%uint8 UNITS_NOT_VALID        = 255~%~%~%~%# MESSAGE DEFINITION -----------------------------------------------------------~%~%Header header       # timestamp and frame_id~%~%#Info~%uint8 technology~%uint8 manufacturer~%uint8 mpn~%~%#Measurement~%float64 raw~%uint8 raw_units     # Measurement units (e.g. ppm, volts, ohm)~%float64 raw_air     # Sensor output for clean air~%float64 calib_A     # Calibration constant. Its exact meaning depends on the sensor~%float64 calib_B     # Calibration constant. Its exact meaning depends on the sensor~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gas_sensor)))
  "Returns full string definition for message of type 'gas_sensor"
  (cl:format cl:nil "# Generic gas sensor msg~%~%# TECHNOLOGY -------------------------------------------------------------------~%uint8 TECH_UNKNOWN   = 0~%uint8 TECH_MOX       = 1~%uint8 TECH_AEC       = 2~%uint8 TECH_EQ        = 50~%uint8 TECH_PID       = 51~%uint8 TECH_SAW       = 52~%uint8 TECH_TEMP      = 100~%uint8 TECH_HUMIDITY  = 101~%uint8 TECH_NOT_VALID = 255~%~%~%# MANUFACTURER -----------------------------------------------------------------~%uint8 MANU_UNKNOWN   = 0~%uint8 MANU_FIGARO    = 1~%uint8 MANU_ALPHASENSE= 2~%uint8 MANU_SGX       = 3~%uint8 MANU_RAE       = 50~%uint8 MANU_HANWEI    = 51~%uint8 MANU_NOT_VALID = 255~%~%~%~%# MPN --------------------------------------------------------------------------~%uint8 MPN_UNKNOWN    = 0~%uint8 MPN_TGS2620    = 50~%uint8 MPN_TGS2600    = 51~%uint8 MPN_TGS2611    = 52~%uint8 MPN_TGS2610    = 53~%uint8 MPN_TGS2612    = 54~%uint8 MPN_MINIRAELITE= 70~%uint8 MPN_NOT_VALID  = 255~%~%~%~%# UNITS ------------------------------------------------------------------------~%uint8 UNITS_UNKNOWN          = 0~%uint8 UNITS_VOLT             = 1~%uint8 UNITS_AMP              = 2~%uint8 UNITS_PPM              = 3~%uint8 UNITS_PPB              = 4~%uint8 UNITS_OHM              = 5~%uint8 UNITS_CENTIGRADE       = 100~%uint8 UNITS_RELATIVEHUMIDITY = 101~%uint8 UNITS_NOT_VALID        = 255~%~%~%~%# MESSAGE DEFINITION -----------------------------------------------------------~%~%Header header       # timestamp and frame_id~%~%#Info~%uint8 technology~%uint8 manufacturer~%uint8 mpn~%~%#Measurement~%float64 raw~%uint8 raw_units     # Measurement units (e.g. ppm, volts, ohm)~%float64 raw_air     # Sensor output for clean air~%float64 calib_A     # Calibration constant. Its exact meaning depends on the sensor~%float64 calib_B     # Calibration constant. Its exact meaning depends on the sensor~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gas_sensor>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     8
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gas_sensor>))
  "Converts a ROS message object to a list"
  (cl:list 'gas_sensor
    (cl:cons ':header (header msg))
    (cl:cons ':technology (technology msg))
    (cl:cons ':manufacturer (manufacturer msg))
    (cl:cons ':mpn (mpn msg))
    (cl:cons ':raw (raw msg))
    (cl:cons ':raw_units (raw_units msg))
    (cl:cons ':raw_air (raw_air msg))
    (cl:cons ':calib_A (calib_A msg))
    (cl:cons ':calib_B (calib_B msg))
))
