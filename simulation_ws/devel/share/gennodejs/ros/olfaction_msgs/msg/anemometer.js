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

class anemometer {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sensor_label = null;
      this.wind_speed = null;
      this.wind_direction = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('sensor_label')) {
        this.sensor_label = initObj.sensor_label
      }
      else {
        this.sensor_label = '';
      }
      if (initObj.hasOwnProperty('wind_speed')) {
        this.wind_speed = initObj.wind_speed
      }
      else {
        this.wind_speed = 0.0;
      }
      if (initObj.hasOwnProperty('wind_direction')) {
        this.wind_direction = initObj.wind_direction
      }
      else {
        this.wind_direction = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type anemometer
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [sensor_label]
    bufferOffset = _serializer.string(obj.sensor_label, buffer, bufferOffset);
    // Serialize message field [wind_speed]
    bufferOffset = _serializer.float32(obj.wind_speed, buffer, bufferOffset);
    // Serialize message field [wind_direction]
    bufferOffset = _serializer.float32(obj.wind_direction, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type anemometer
    let len;
    let data = new anemometer(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sensor_label]
    data.sensor_label = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [wind_speed]
    data.wind_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [wind_direction]
    data.wind_direction = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.sensor_label.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'olfaction_msgs/anemometer';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6eda3f54da66470bd27452be26d76e3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header		    #timestamp, frame_id
    
    string sensor_label	    #identifier
    float32 wind_speed	    #m/s
    float32 wind_direction	#rad
    
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
    const resolved = new anemometer(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sensor_label !== undefined) {
      resolved.sensor_label = msg.sensor_label;
    }
    else {
      resolved.sensor_label = ''
    }

    if (msg.wind_speed !== undefined) {
      resolved.wind_speed = msg.wind_speed;
    }
    else {
      resolved.wind_speed = 0.0
    }

    if (msg.wind_direction !== undefined) {
      resolved.wind_direction = msg.wind_direction;
    }
    else {
      resolved.wind_direction = 0.0
    }

    return resolved;
    }
};

module.exports = anemometer;
