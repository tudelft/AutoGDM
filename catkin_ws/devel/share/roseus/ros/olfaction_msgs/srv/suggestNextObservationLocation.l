;; Auto-generated. Do not edit!


(when (boundp 'olfaction_msgs::suggestNextObservationLocation)
  (if (not (find-package "OLFACTION_MSGS"))
    (make-package "OLFACTION_MSGS"))
  (shadow 'suggestNextObservationLocation (find-package "OLFACTION_MSGS")))
(unless (find-package "OLFACTION_MSGS::SUGGESTNEXTOBSERVATIONLOCATION")
  (make-package "OLFACTION_MSGS::SUGGESTNEXTOBSERVATIONLOCATION"))
(unless (find-package "OLFACTION_MSGS::SUGGESTNEXTOBSERVATIONLOCATIONREQUEST")
  (make-package "OLFACTION_MSGS::SUGGESTNEXTOBSERVATIONLOCATIONREQUEST"))
(unless (find-package "OLFACTION_MSGS::SUGGESTNEXTOBSERVATIONLOCATIONRESPONSE")
  (make-package "OLFACTION_MSGS::SUGGESTNEXTOBSERVATIONLOCATIONRESPONSE"))

(in-package "ROS")



(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass olfaction_msgs::suggestNextObservationLocationRequest
  :super ros::object
  :slots ())

(defmethod olfaction_msgs::suggestNextObservationLocationRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass olfaction_msgs::suggestNextObservationLocationResponse
  :super ros::object
  :slots (_odom ))

(defmethod olfaction_msgs::suggestNextObservationLocationResponse
  (:init
   (&key
    ((:odom __odom) (instance nav_msgs::Odometry :init))
    )
   (send-super :init)
   (setq _odom __odom)
   self)
  (:odom
   (&rest __odom)
   (if (keywordp (car __odom))
       (send* _odom __odom)
     (progn
       (if __odom (setq _odom (car __odom)))
       _odom)))
  (:serialization-length
   ()
   (+
    ;; nav_msgs/Odometry _odom
    (send _odom :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/Odometry _odom
       (send _odom :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/Odometry _odom
     (send _odom :deserialize buf ptr-) (incf ptr- (send _odom :serialization-length))
   ;;
   self)
  )

(defclass olfaction_msgs::suggestNextObservationLocation
  :super ros::object
  :slots ())

(setf (get olfaction_msgs::suggestNextObservationLocation :md5sum-) "75d9701e058ed9a7608ba3dbc16b5b7e")
(setf (get olfaction_msgs::suggestNextObservationLocation :datatype-) "olfaction_msgs/suggestNextObservationLocation")
(setf (get olfaction_msgs::suggestNextObservationLocation :request) olfaction_msgs::suggestNextObservationLocationRequest)
(setf (get olfaction_msgs::suggestNextObservationLocation :response) olfaction_msgs::suggestNextObservationLocationResponse)

(defmethod olfaction_msgs::suggestNextObservationLocationRequest
  (:response () (instance olfaction_msgs::suggestNextObservationLocationResponse :init)))

(setf (get olfaction_msgs::suggestNextObservationLocationRequest :md5sum-) "75d9701e058ed9a7608ba3dbc16b5b7e")
(setf (get olfaction_msgs::suggestNextObservationLocationRequest :datatype-) "olfaction_msgs/suggestNextObservationLocationRequest")
(setf (get olfaction_msgs::suggestNextObservationLocationRequest :definition-)
      "---
nav_msgs/Odometry odom


================================================================================
MSG: nav_msgs/Odometry
# This represents an estimate of a position and velocity in free space.  
# The pose in this message should be specified in the coordinate frame given by header.frame_id.
# The twist in this message should be specified in the coordinate frame given by the child_frame_id
Header header
string child_frame_id
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist

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
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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
")

(setf (get olfaction_msgs::suggestNextObservationLocationResponse :md5sum-) "75d9701e058ed9a7608ba3dbc16b5b7e")
(setf (get olfaction_msgs::suggestNextObservationLocationResponse :datatype-) "olfaction_msgs/suggestNextObservationLocationResponse")
(setf (get olfaction_msgs::suggestNextObservationLocationResponse :definition-)
      "---
nav_msgs/Odometry odom


================================================================================
MSG: nav_msgs/Odometry
# This represents an estimate of a position and velocity in free space.  
# The pose in this message should be specified in the coordinate frame given by header.frame_id.
# The twist in this message should be specified in the coordinate frame given by the child_frame_id
Header header
string child_frame_id
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist

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
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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
")



(provide :olfaction_msgs/suggestNextObservationLocation "75d9701e058ed9a7608ba3dbc16b5b7e")


