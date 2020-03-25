; Auto-generated. Do not edit!


(cl:in-package gaden_player-srv)


;//! \htmlinclude GasPosition-request.msg.html

(cl:defclass <GasPosition-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0))
)

(cl:defclass GasPosition-request (<GasPosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GasPosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GasPosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gaden_player-srv:<GasPosition-request> is deprecated: use gaden_player-srv:GasPosition-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <GasPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gaden_player-srv:x-val is deprecated.  Use gaden_player-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <GasPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gaden_player-srv:y-val is deprecated.  Use gaden_player-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <GasPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gaden_player-srv:z-val is deprecated.  Use gaden_player-srv:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GasPosition-request>) ostream)
  "Serializes a message object of type '<GasPosition-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GasPosition-request>) istream)
  "Deserializes a message object of type '<GasPosition-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GasPosition-request>)))
  "Returns string type for a service object of type '<GasPosition-request>"
  "gaden_player/GasPositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GasPosition-request)))
  "Returns string type for a service object of type 'GasPosition-request"
  "gaden_player/GasPositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GasPosition-request>)))
  "Returns md5sum for a message object of type '<GasPosition-request>"
  "a31b6d25f795275d0b32473395891f52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GasPosition-request)))
  "Returns md5sum for a message object of type 'GasPosition-request"
  "a31b6d25f795275d0b32473395891f52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GasPosition-request>)))
  "Returns full string definition for message of type '<GasPosition-request>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GasPosition-request)))
  "Returns full string definition for message of type 'GasPosition-request"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GasPosition-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GasPosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GasPosition-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
;//! \htmlinclude GasPosition-response.msg.html

(cl:defclass <GasPosition-response> (roslisp-msg-protocol:ros-message)
  ((gas_conc
    :reader gas_conc
    :initarg :gas_conc
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (gas_type
    :reader gas_type
    :initarg :gas_type
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass GasPosition-response (<GasPosition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GasPosition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GasPosition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gaden_player-srv:<GasPosition-response> is deprecated: use gaden_player-srv:GasPosition-response instead.")))

(cl:ensure-generic-function 'gas_conc-val :lambda-list '(m))
(cl:defmethod gas_conc-val ((m <GasPosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gaden_player-srv:gas_conc-val is deprecated.  Use gaden_player-srv:gas_conc instead.")
  (gas_conc m))

(cl:ensure-generic-function 'gas_type-val :lambda-list '(m))
(cl:defmethod gas_type-val ((m <GasPosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gaden_player-srv:gas_type-val is deprecated.  Use gaden_player-srv:gas_type instead.")
  (gas_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GasPosition-response>) ostream)
  "Serializes a message object of type '<GasPosition-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'gas_conc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'gas_conc))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'gas_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'gas_type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GasPosition-response>) istream)
  "Deserializes a message object of type '<GasPosition-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'gas_conc) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'gas_conc)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'gas_type) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'gas_type)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GasPosition-response>)))
  "Returns string type for a service object of type '<GasPosition-response>"
  "gaden_player/GasPositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GasPosition-response)))
  "Returns string type for a service object of type 'GasPosition-response"
  "gaden_player/GasPositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GasPosition-response>)))
  "Returns md5sum for a message object of type '<GasPosition-response>"
  "a31b6d25f795275d0b32473395891f52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GasPosition-response)))
  "Returns md5sum for a message object of type 'GasPosition-response"
  "a31b6d25f795275d0b32473395891f52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GasPosition-response>)))
  "Returns full string definition for message of type '<GasPosition-response>"
  (cl:format cl:nil "float64[] gas_conc~%string[] gas_type~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GasPosition-response)))
  "Returns full string definition for message of type 'GasPosition-response"
  (cl:format cl:nil "float64[] gas_conc~%string[] gas_type~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GasPosition-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'gas_conc) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'gas_type) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GasPosition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GasPosition-response
    (cl:cons ':gas_conc (gas_conc msg))
    (cl:cons ':gas_type (gas_type msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GasPosition)))
  'GasPosition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GasPosition)))
  'GasPosition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GasPosition)))
  "Returns string type for a service object of type '<GasPosition>"
  "gaden_player/GasPosition")