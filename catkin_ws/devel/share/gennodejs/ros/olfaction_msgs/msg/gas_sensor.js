// Auto-generated. Do not edit!

// (in-package olfaction_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class gas_sensor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.technology = null;
      this.manufacturer = null;
      this.mpn = null;
      this.raw = null;
      this.raw_units = null;
      this.raw_air = null;
      this.calib_A = null;
      this.calib_B = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('technology')) {
        this.technology = initObj.technology
      }
      else {
        this.technology = 0;
      }
      if (initObj.hasOwnProperty('manufacturer')) {
        this.manufacturer = initObj.manufacturer
      }
      else {
        this.manufacturer = 0;
      }
      if (initObj.hasOwnProperty('mpn')) {
        this.mpn = initObj.mpn
      }
      else {
        this.mpn = 0;
      }
      if (initObj.hasOwnProperty('raw')) {
        this.raw = initObj.raw
      }
      else {
        this.raw = 0.0;
      }
      if (initObj.hasOwnProperty('raw_units')) {
        this.raw_units = initObj.raw_units
      }
      else {
        this.raw_units = 0;
      }
      if (initObj.hasOwnProperty('raw_air')) {
        this.raw_air = initObj.raw_air
      }
      else {
        this.raw_air = 0.0;
      }
      if (initObj.hasOwnProperty('calib_A')) {
        this.calib_A = initObj.calib_A
      }
      else {
        this.calib_A = 0.0;
      }
      if (initObj.hasOwnProperty('calib_B')) {
        this.calib_B = initObj.calib_B
      }
      else {
        this.calib_B = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gas_sensor
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [technology]
    bufferOffset = _serializer.uint8(obj.technology, buffer, bufferOffset);
    // Serialize message field [manufacturer]
    bufferOffset = _serializer.uint8(obj.manufacturer, buffer, bufferOffset);
    // Serialize message field [mpn]
    bufferOffset = _serializer.uint8(obj.mpn, buffer, bufferOffset);
    // Serialize message field [raw]
    bufferOffset = _serializer.float64(obj.raw, buffer, bufferOffset);
    // Serialize message field [raw_units]
    bufferOffset = _serializer.uint8(obj.raw_units, buffer, bufferOffset);
    // Serialize message field [raw_air]
    bufferOffset = _serializer.float64(obj.raw_air, buffer, bufferOffset);
    // Serialize message field [calib_A]
    bufferOffset = _serializer.float64(obj.calib_A, buffer, bufferOffset);
    // Serialize message field [calib_B]
    bufferOffset = _serializer.float64(obj.calib_B, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gas_sensor
    let len;
    let data = new gas_sensor(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [technology]
    data.technology = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [manufacturer]
    data.manufacturer = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mpn]
    data.mpn = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [raw]
    data.raw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [raw_units]
    data.raw_units = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [raw_air]
    data.raw_air = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [calib_A]
    data.calib_A = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [calib_B]
    data.calib_B = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'olfaction_msgs/gas_sensor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f19a4378539410bc0da063e4424de564';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gas_sensor(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.technology !== undefined) {
      resolved.technology = msg.technology;
    }
    else {
      resolved.technology = 0
    }

    if (msg.manufacturer !== undefined) {
      resolved.manufacturer = msg.manufacturer;
    }
    else {
      resolved.manufacturer = 0
    }

    if (msg.mpn !== undefined) {
      resolved.mpn = msg.mpn;
    }
    else {
      resolved.mpn = 0
    }

    if (msg.raw !== undefined) {
      resolved.raw = msg.raw;
    }
    else {
      resolved.raw = 0.0
    }

    if (msg.raw_units !== undefined) {
      resolved.raw_units = msg.raw_units;
    }
    else {
      resolved.raw_units = 0
    }

    if (msg.raw_air !== undefined) {
      resolved.raw_air = msg.raw_air;
    }
    else {
      resolved.raw_air = 0.0
    }

    if (msg.calib_A !== undefined) {
      resolved.calib_A = msg.calib_A;
    }
    else {
      resolved.calib_A = 0.0
    }

    if (msg.calib_B !== undefined) {
      resolved.calib_B = msg.calib_B;
    }
    else {
      resolved.calib_B = 0.0
    }

    return resolved;
    }
};

// Constants for message
gas_sensor.Constants = {
  TECH_UNKNOWN: 0,
  TECH_MOX: 1,
  TECH_AEC: 2,
  TECH_EQ: 50,
  TECH_PID: 51,
  TECH_SAW: 52,
  TECH_TEMP: 100,
  TECH_HUMIDITY: 101,
  TECH_NOT_VALID: 255,
  MANU_UNKNOWN: 0,
  MANU_FIGARO: 1,
  MANU_ALPHASENSE: 2,
  MANU_SGX: 3,
  MANU_RAE: 50,
  MANU_HANWEI: 51,
  MANU_NOT_VALID: 255,
  MPN_UNKNOWN: 0,
  MPN_TGS2620: 50,
  MPN_TGS2600: 51,
  MPN_TGS2611: 52,
  MPN_TGS2610: 53,
  MPN_TGS2612: 54,
  MPN_MINIRAELITE: 70,
  MPN_NOT_VALID: 255,
  UNITS_UNKNOWN: 0,
  UNITS_VOLT: 1,
  UNITS_AMP: 2,
  UNITS_PPM: 3,
  UNITS_PPB: 4,
  UNITS_OHM: 5,
  UNITS_CENTIGRADE: 100,
  UNITS_RELATIVEHUMIDITY: 101,
  UNITS_NOT_VALID: 255,
}

module.exports = gas_sensor;
