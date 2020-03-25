; Auto-generated. Do not edit!


(cl:in-package olfaction_msgs-msg)


;//! \htmlinclude gas_sensor_array.msg.html

(cl:defclass <gas_sensor_array> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensors
    :reader sensors
    :initarg :sensors
    :type (cl:vector olfaction_msgs-msg:gas_sensor)
   :initform (cl:make-array 0 :element-type 'olfaction_msgs-msg:gas_sensor :initial-element (cl:make-instance 'olfaction_msgs-msg:gas_sensor))))
)

(cl:defclass gas_sensor_array (<gas_sensor_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gas_sensor_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gas_sensor_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name olfaction_msgs-msg:<gas_sensor_array> is deprecated: use olfaction_msgs-msg:gas_sensor_array instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <gas_sensor_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:header-val is deprecated.  Use olfaction_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensors-val :lambda-list '(m))
(cl:defmethod sensors-val ((m <gas_sensor_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader olfaction_msgs-msg:sensors-val is deprecated.  Use olfaction_msgs-msg:sensors instead.")
  (sensors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gas_sensor_array>) ostream)
  "Serializes a message object of type '<gas_sensor_array>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sensors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'sensors))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gas_sensor_array>) istream)
  "Deserializes a message object of type '<gas_sensor_array>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sensors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sensors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'olfaction_msgs-msg:gas_sensor))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gas_sensor_array>)))
  "Returns string type for a message object of type '<gas_sensor_array>"
  "olfaction_msgs/gas_sensor_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gas_sensor_array)))
  "Returns string type for a message object of type 'gas_sensor_array"
  "olfaction_msgs/gas_sensor_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gas_sensor_array>)))
  "Returns md5sum for a message object of type '<gas_sensor_array>"
  "2f2312a6b81ab41737f07bd20ae43828")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gas_sensor_array)))
  "Returns md5sum for a message object of type 'gas_sensor_array"
  "2f2312a6b81ab41737f07bd20ae43828")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gas_sensor_array>)))
  "Returns full string definition for message of type '<gas_sensor_array>"
  (cl:format cl:nil "# Generic array of sensors (gas, temp, RH). This is the common msg format for electronic noses.~%~%Header header			# timestamp and frame_id~%gas_sensor[] sensors    # the sensors in the array (see gas_sensor msg)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: olfaction_msgs/gas_sensor~%# Generic gas sensor msg~%~%# TECHNOLOGY -------------------------------------------------------------------~%uint8 TECH_UNKNOWN   = 0~%uint8 TECH_MOX       = 1~%uint8 TECH_AEC       = 2~%uint8 TECH_EQ        = 50~%uint8 TECH_PID       = 51~%uint8 TECH_SAW       = 52~%uint8 TECH_TEMP      = 100~%uint8 TECH_HUMIDITY  = 101~%uint8 TECH_NOT_VALID = 255~%~%~%# MANUFACTURER -----------------------------------------------------------------~%uint8 MANU_UNKNOWN   = 0~%uint8 MANU_FIGARO    = 1~%uint8 MANU_ALPHASENSE= 2~%uint8 MANU_SGX       = 3~%uint8 MANU_RAE       = 50~%uint8 MANU_HANWEI    = 51~%uint8 MANU_NOT_VALID = 255~%~%~%~%# MPN --------------------------------------------------------------------------~%uint8 MPN_UNKNOWN    = 0~%uint8 MPN_TGS2620    = 50~%uint8 MPN_TGS2600    = 51~%uint8 MPN_TGS2611    = 52~%uint8 MPN_TGS2610    = 53~%uint8 MPN_TGS2612    = 54~%uint8 MPN_MINIRAELITE= 70~%uint8 MPN_NOT_VALID  = 255~%~%~%~%# UNITS ------------------------------------------------------------------------~%uint8 UNITS_UNKNOWN          = 0~%uint8 UNITS_VOLT             = 1~%uint8 UNITS_AMP              = 2~%uint8 UNITS_PPM              = 3~%uint8 UNITS_PPB              = 4~%uint8 UNITS_OHM              = 5~%uint8 UNITS_CENTIGRADE       = 100~%uint8 UNITS_RELATIVEHUMIDITY = 101~%uint8 UNITS_NOT_VALID        = 255~%~%~%~%# MESSAGE DEFINITION -----------------------------------------------------------~%~%Header header       # timestamp and frame_id~%~%#Info~%uint8 technology~%uint8 manufacturer~%uint8 mpn~%~%#Measurement~%float64 raw~%uint8 raw_units     # Measurement units (e.g. ppm, volts, ohm)~%float64 raw_air     # Sensor output for clean air~%float64 calib_A     # Calibration constant. Its exact meaning depends on the sensor~%float64 calib_B     # Calibration constant. Its exact meaning depends on the sensor~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gas_sensor_array)))
  "Returns full string definition for message of type 'gas_sensor_array"
  (cl:format cl:nil "# Generic array of sensors (gas, temp, RH). This is the common msg format for electronic noses.~%~%Header header			# timestamp and frame_id~%gas_sensor[] sensors    # the sensors in the array (see gas_sensor msg)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: olfaction_msgs/gas_sensor~%# Generic gas sensor msg~%~%# TECHNOLOGY -------------------------------------------------------------------~%uint8 TECH_UNKNOWN   = 0~%uint8 TECH_MOX       = 1~%uint8 TECH_AEC       = 2~%uint8 TECH_EQ        = 50~%uint8 TECH_PID       = 51~%uint8 TECH_SAW       = 52~%uint8 TECH_TEMP      = 100~%uint8 TECH_HUMIDITY  = 101~%uint8 TECH_NOT_VALID = 255~%~%~%# MANUFACTURER -----------------------------------------------------------------~%uint8 MANU_UNKNOWN   = 0~%uint8 MANU_FIGARO    = 1~%uint8 MANU_ALPHASENSE= 2~%uint8 MANU_SGX       = 3~%uint8 MANU_RAE       = 50~%uint8 MANU_HANWEI    = 51~%uint8 MANU_NOT_VALID = 255~%~%~%~%# MPN --------------------------------------------------------------------------~%uint8 MPN_UNKNOWN    = 0~%uint8 MPN_TGS2620    = 50~%uint8 MPN_TGS2600    = 51~%uint8 MPN_TGS2611    = 52~%uint8 MPN_TGS2610    = 53~%uint8 MPN_TGS2612    = 54~%uint8 MPN_MINIRAELITE= 70~%uint8 MPN_NOT_VALID  = 255~%~%~%~%# UNITS ------------------------------------------------------------------------~%uint8 UNITS_UNKNOWN          = 0~%uint8 UNITS_VOLT             = 1~%uint8 UNITS_AMP              = 2~%uint8 UNITS_PPM              = 3~%uint8 UNITS_PPB              = 4~%uint8 UNITS_OHM              = 5~%uint8 UNITS_CENTIGRADE       = 100~%uint8 UNITS_RELATIVEHUMIDITY = 101~%uint8 UNITS_NOT_VALID        = 255~%~%~%~%# MESSAGE DEFINITION -----------------------------------------------------------~%~%Header header       # timestamp and frame_id~%~%#Info~%uint8 technology~%uint8 manufacturer~%uint8 mpn~%~%#Measurement~%float64 raw~%uint8 raw_units     # Measurement units (e.g. ppm, volts, ohm)~%float64 raw_air     # Sensor output for clean air~%float64 calib_A     # Calibration constant. Its exact meaning depends on the sensor~%float64 calib_B     # Calibration constant. Its exact meaning depends on the sensor~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gas_sensor_array>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sensors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gas_sensor_array>))
  "Converts a ROS message object to a list"
  (cl:list 'gas_sensor_array
    (cl:cons ':header (header msg))
    (cl:cons ':sensors (sensors msg))
))
