// Auto-generated. Do not edit!

// (in-package gaden_player.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GasPositionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GasPositionRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GasPositionRequest
    let len;
    let data = new GasPositionRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gaden_player/GasPositionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a842b65f413084dc2b10fb484ea7f17';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GasPositionRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    return resolved;
    }
};

class GasPositionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gas_conc = null;
      this.gas_type = null;
    }
    else {
      if (initObj.hasOwnProperty('gas_conc')) {
        this.gas_conc = initObj.gas_conc
      }
      else {
        this.gas_conc = [];
      }
      if (initObj.hasOwnProperty('gas_type')) {
        this.gas_type = initObj.gas_type
      }
      else {
        this.gas_type = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GasPositionResponse
    // Serialize message field [gas_conc]
    bufferOffset = _arraySerializer.float64(obj.gas_conc, buffer, bufferOffset, null);
    // Serialize message field [gas_type]
    bufferOffset = _arraySerializer.string(obj.gas_type, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GasPositionResponse
    let len;
    let data = new GasPositionResponse(null);
    // Deserialize message field [gas_conc]
    data.gas_conc = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [gas_type]
    data.gas_type = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.gas_conc.length;
    object.gas_type.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gaden_player/GasPositionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '16b1b92923412b5b6f4abfca890a54a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] gas_conc
    string[] gas_type
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GasPositionResponse(null);
    if (msg.gas_conc !== undefined) {
      resolved.gas_conc = msg.gas_conc;
    }
    else {
      resolved.gas_conc = []
    }

    if (msg.gas_type !== undefined) {
      resolved.gas_type = msg.gas_type;
    }
    else {
      resolved.gas_type = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GasPositionRequest,
  Response: GasPositionResponse,
  md5sum() { return 'a31b6d25f795275d0b32473395891f52'; },
  datatype() { return 'gaden_player/GasPosition'; }
};
