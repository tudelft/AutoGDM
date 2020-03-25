// Auto-generated. Do not edit!

// (in-package olfaction_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let gas_sensor = require('./gas_sensor.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class gas_sensor_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sensors = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('sensors')) {
        this.sensors = initObj.sensors
      }
      else {
        this.sensors = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gas_sensor_array
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [sensors]
    // Serialize the length for message field [sensors]
    bufferOffset = _serializer.uint32(obj.sensors.length, buffer, bufferOffset);
    obj.sensors.forEach((val) => {
      bufferOffset = gas_sensor.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gas_sensor_array
    let len;
    let data = new gas_sensor_array(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sensors]
    // Deserialize array length for message field [sensors]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.sensors = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.sensors[i] = gas_sensor.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.sensors.forEach((val) => {
      length += gas_sensor.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'olfaction_msgs/gas_sensor_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2f2312a6b81ab41737f07bd20ae43828';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Generic array of sensors (gas, temp, RH). This is the common msg format for electronic noses.
    
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
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gas_sensor_array(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sensors !== undefined) {
      resolved.sensors = new Array(msg.sensors.length);
      for (let i = 0; i < resolved.sensors.length; ++i) {
        resolved.sensors[i] = gas_sensor.Resolve(msg.sensors[i]);
      }
    }
    else {
      resolved.sensors = []
    }

    return resolved;
    }
};

module.exports = gas_sensor_array;
