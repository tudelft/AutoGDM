;; Auto-generated. Do not edit!


(when (boundp 'olfaction_msgs::gas_sensor_array)
  (if (not (find-package "OLFACTION_MSGS"))
    (make-package "OLFACTION_MSGS"))
  (shadow 'gas_sensor_array (find-package "OLFACTION_MSGS")))
(unless (find-package "OLFACTION_MSGS::GAS_SENSOR_ARRAY")
  (make-package "OLFACTION_MSGS::GAS_SENSOR_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude gas_sensor_array.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass olfaction_msgs::gas_sensor_array
  :super ros::object
  :slots (_header _sensors ))

(defmethod olfaction_msgs::gas_sensor_array
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensors __sensors) (let (r) (dotimes (i 0) (push (instance olfaction_msgs::gas_sensor :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensors __sensors)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sensors
   (&rest __sensors)
   (if (keywordp (car __sensors))
       (send* _sensors __sensors)
     (progn
       (if __sensors (setq _sensors (car __sensors)))
       _sensors)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; olfaction_msgs/gas_sensor[] _sensors
    (apply #'+ (send-all _sensors :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; olfaction_msgs/gas_sensor[] _sensors
     (write-long (length _sensors) s)
     (dolist (elem _sensors)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; olfaction_msgs/gas_sensor[] _sensors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sensors (let (r) (dotimes (i n) (push (instance olfaction_msgs::gas_sensor :init) r)) r))
     (dolist (elem- _sensors)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get olfaction_msgs::gas_sensor_array :md5sum-) "2f2312a6b81ab41737f07bd20ae43828")
(setf (get olfaction_msgs::gas_sensor_array :datatype-) "olfaction_msgs/gas_sensor_array")
(setf (get olfaction_msgs::gas_sensor_array :definition-)
      "# Generic array of sensors (gas, temp, RH). This is the common msg format for electronic noses.

Header header			# timestamp and frame_id
gas_sensor[] sensors    # the sensors in the array (see gas_sensor msg)

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
MSG: olfaction_msgs/gas_sensor
# Generic gas sensor msg

# TECHNOLOGY -------------------------------------------------------------------
uint8 TECH_UNKNOWN   = 0
uint8 TECH_MOX       = 1
uint8 TECH_AEC       = 2
uint8 TECH_EQ        = 50
uint8 TECH_PID       = 51
uint8 TECH_SAW       = 52
uint8 TECH_TEMP      = 100
uint8 TECH_HUMIDITY  = 101
uint8 TECH_NOT_VALID = 255


# MANUFACTURER -----------------------------------------------------------------
uint8 MANU_UNKNOWN   = 0
uint8 MANU_FIGARO    = 1
uint8 MANU_ALPHASENSE= 2
uint8 MANU_SGX       = 3
uint8 MANU_RAE       = 50
uint8 MANU_HANWEI    = 51
uint8 MANU_NOT_VALID = 255



# MPN --------------------------------------------------------------------------
uint8 MPN_UNKNOWN    = 0
uint8 MPN_TGS2620    = 50
uint8 MPN_TGS2600    = 51
uint8 MPN_TGS2611    = 52
uint8 MPN_TGS2610    = 53
uint8 MPN_TGS2612    = 54
uint8 MPN_MINIRAELITE= 70
uint8 MPN_NOT_VALID  = 255



# UNITS ------------------------------------------------------------------------
uint8 UNITS_UNKNOWN          = 0
uint8 UNITS_VOLT             = 1
uint8 UNITS_AMP              = 2
uint8 UNITS_PPM              = 3
uint8 UNITS_PPB              = 4
uint8 UNITS_OHM              = 5
uint8 UNITS_CENTIGRADE       = 100
uint8 UNITS_RELATIVEHUMIDITY = 101
uint8 UNITS_NOT_VALID        = 255



# MESSAGE DEFINITION -----------------------------------------------------------

Header header       # timestamp and frame_id

#Info
uint8 technology
uint8 manufacturer
uint8 mpn

#Measurement
float64 raw
uint8 raw_units     # Measurement units (e.g. ppm, volts, ohm)
float64 raw_air     # Sensor output for clean air
float64 calib_A     # Calibration constant. Its exact meaning depends on the sensor
float64 calib_B     # Calibration constant. Its exact meaning depends on the sensor


")



(provide :olfaction_msgs/gas_sensor_array "2f2312a6b81ab41737f07bd20ae43828")


