;; Auto-generated. Do not edit!


(when (boundp 'olfaction_msgs::gas_sensor)
  (if (not (find-package "OLFACTION_MSGS"))
    (make-package "OLFACTION_MSGS"))
  (shadow 'gas_sensor (find-package "OLFACTION_MSGS")))
(unless (find-package "OLFACTION_MSGS::GAS_SENSOR")
  (make-package "OLFACTION_MSGS::GAS_SENSOR"))

(in-package "ROS")
;;//! \htmlinclude gas_sensor.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*TECH_UNKNOWN*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_UNKNOWN* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_UNKNOWN* 0)
(intern "*TECH_MOX*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_MOX* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_MOX* 1)
(intern "*TECH_AEC*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_AEC* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_AEC* 2)
(intern "*TECH_EQ*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_EQ* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_EQ* 50)
(intern "*TECH_PID*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_PID* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_PID* 51)
(intern "*TECH_SAW*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_SAW* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_SAW* 52)
(intern "*TECH_TEMP*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_TEMP* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_TEMP* 100)
(intern "*TECH_HUMIDITY*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_HUMIDITY* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_HUMIDITY* 101)
(intern "*TECH_NOT_VALID*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*TECH_NOT_VALID* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*TECH_NOT_VALID* 255)
(intern "*MANU_UNKNOWN*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MANU_UNKNOWN* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MANU_UNKNOWN* 0)
(intern "*MANU_FIGARO*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MANU_FIGARO* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MANU_FIGARO* 1)
(intern "*MANU_ALPHASENSE*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MANU_ALPHASENSE* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MANU_ALPHASENSE* 2)
(intern "*MANU_SGX*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MANU_SGX* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MANU_SGX* 3)
(intern "*MANU_RAE*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MANU_RAE* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MANU_RAE* 50)
(intern "*MANU_HANWEI*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MANU_HANWEI* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MANU_HANWEI* 51)
(intern "*MANU_NOT_VALID*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MANU_NOT_VALID* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MANU_NOT_VALID* 255)
(intern "*MPN_UNKNOWN*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_UNKNOWN* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_UNKNOWN* 0)
(intern "*MPN_TGS2620*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_TGS2620* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_TGS2620* 50)
(intern "*MPN_TGS2600*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_TGS2600* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_TGS2600* 51)
(intern "*MPN_TGS2611*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_TGS2611* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_TGS2611* 52)
(intern "*MPN_TGS2610*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_TGS2610* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_TGS2610* 53)
(intern "*MPN_TGS2612*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_TGS2612* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_TGS2612* 54)
(intern "*MPN_MINIRAELITE*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_MINIRAELITE* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_MINIRAELITE* 70)
(intern "*MPN_NOT_VALID*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*MPN_NOT_VALID* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*MPN_NOT_VALID* 255)
(intern "*UNITS_UNKNOWN*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_UNKNOWN* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_UNKNOWN* 0)
(intern "*UNITS_VOLT*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_VOLT* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_VOLT* 1)
(intern "*UNITS_AMP*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_AMP* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_AMP* 2)
(intern "*UNITS_PPM*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_PPM* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_PPM* 3)
(intern "*UNITS_PPB*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_PPB* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_PPB* 4)
(intern "*UNITS_OHM*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_OHM* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_OHM* 5)
(intern "*UNITS_CENTIGRADE*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_CENTIGRADE* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_CENTIGRADE* 100)
(intern "*UNITS_RELATIVEHUMIDITY*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_RELATIVEHUMIDITY* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_RELATIVEHUMIDITY* 101)
(intern "*UNITS_NOT_VALID*" (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(shadow '*UNITS_NOT_VALID* (find-package "OLFACTION_MSGS::GAS_SENSOR"))
(defconstant olfaction_msgs::gas_sensor::*UNITS_NOT_VALID* 255)
(defclass olfaction_msgs::gas_sensor
  :super ros::object
  :slots (_header _technology _manufacturer _mpn _raw _raw_units _raw_air _calib_A _calib_B ))

(defmethod olfaction_msgs::gas_sensor
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:technology __technology) 0)
    ((:manufacturer __manufacturer) 0)
    ((:mpn __mpn) 0)
    ((:raw __raw) 0.0)
    ((:raw_units __raw_units) 0)
    ((:raw_air __raw_air) 0.0)
    ((:calib_A __calib_A) 0.0)
    ((:calib_B __calib_B) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _technology (round __technology))
   (setq _manufacturer (round __manufacturer))
   (setq _mpn (round __mpn))
   (setq _raw (float __raw))
   (setq _raw_units (round __raw_units))
   (setq _raw_air (float __raw_air))
   (setq _calib_A (float __calib_A))
   (setq _calib_B (float __calib_B))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:technology
   (&optional __technology)
   (if __technology (setq _technology __technology)) _technology)
  (:manufacturer
   (&optional __manufacturer)
   (if __manufacturer (setq _manufacturer __manufacturer)) _manufacturer)
  (:mpn
   (&optional __mpn)
   (if __mpn (setq _mpn __mpn)) _mpn)
  (:raw
   (&optional __raw)
   (if __raw (setq _raw __raw)) _raw)
  (:raw_units
   (&optional __raw_units)
   (if __raw_units (setq _raw_units __raw_units)) _raw_units)
  (:raw_air
   (&optional __raw_air)
   (if __raw_air (setq _raw_air __raw_air)) _raw_air)
  (:calib_A
   (&optional __calib_A)
   (if __calib_A (setq _calib_A __calib_A)) _calib_A)
  (:calib_B
   (&optional __calib_B)
   (if __calib_B (setq _calib_B __calib_B)) _calib_B)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _technology
    1
    ;; uint8 _manufacturer
    1
    ;; uint8 _mpn
    1
    ;; float64 _raw
    8
    ;; uint8 _raw_units
    1
    ;; float64 _raw_air
    8
    ;; float64 _calib_A
    8
    ;; float64 _calib_B
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _technology
       (write-byte _technology s)
     ;; uint8 _manufacturer
       (write-byte _manufacturer s)
     ;; uint8 _mpn
       (write-byte _mpn s)
     ;; float64 _raw
       (sys::poke _raw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _raw_units
       (write-byte _raw_units s)
     ;; float64 _raw_air
       (sys::poke _raw_air (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _calib_A
       (sys::poke _calib_A (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _calib_B
       (sys::poke _calib_B (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _technology
     (setq _technology (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _manufacturer
     (setq _manufacturer (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _mpn
     (setq _mpn (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _raw
     (setq _raw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _raw_units
     (setq _raw_units (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _raw_air
     (setq _raw_air (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _calib_A
     (setq _calib_A (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _calib_B
     (setq _calib_B (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get olfaction_msgs::gas_sensor :md5sum-) "f19a4378539410bc0da063e4424de564")
(setf (get olfaction_msgs::gas_sensor :datatype-) "olfaction_msgs/gas_sensor")
(setf (get olfaction_msgs::gas_sensor :definition-)
      "# Generic gas sensor msg

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



(provide :olfaction_msgs/gas_sensor "f19a4378539410bc0da063e4424de564")


