# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from olfaction_msgs/gas_sensor_array.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import olfaction_msgs.msg
import std_msgs.msg

class gas_sensor_array(genpy.Message):
  _md5sum = "2f2312a6b81ab41737f07bd20ae43828"
  _type = "olfaction_msgs/gas_sensor_array"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """# Generic array of sensors (gas, temp, RH). This is the common msg format for electronic noses.

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

"""
  __slots__ = ['header','sensors']
  _slot_types = ['std_msgs/Header','olfaction_msgs/gas_sensor[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,sensors

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(gas_sensor_array, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.sensors is None:
        self.sensors = []
    else:
      self.header = std_msgs.msg.Header()
      self.sensors = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.sensors)
      buff.write(_struct_I.pack(length))
      for val1 in self.sensors:
        _v1 = val1.header
        buff.write(_get_struct_I().pack(_v1.seq))
        _v2 = _v1.stamp
        _x = _v2
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v1.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.pack('<I%ss'%length, length, _x))
        _x = val1
        buff.write(_get_struct_3BdB3d().pack(_x.technology, _x.manufacturer, _x.mpn, _x.raw, _x.raw_units, _x.raw_air, _x.calib_A, _x.calib_B))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.sensors is None:
        self.sensors = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.sensors = []
      for i in range(0, length):
        val1 = olfaction_msgs.msg.gas_sensor()
        _v3 = val1.header
        start = end
        end += 4
        (_v3.seq,) = _get_struct_I().unpack(str[start:end])
        _v4 = _v3.stamp
        _x = _v4
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v3.frame_id = str[start:end].decode('utf-8')
        else:
          _v3.frame_id = str[start:end]
        _x = val1
        start = end
        end += 36
        (_x.technology, _x.manufacturer, _x.mpn, _x.raw, _x.raw_units, _x.raw_air, _x.calib_A, _x.calib_B,) = _get_struct_3BdB3d().unpack(str[start:end])
        self.sensors.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.sensors)
      buff.write(_struct_I.pack(length))
      for val1 in self.sensors:
        _v5 = val1.header
        buff.write(_get_struct_I().pack(_v5.seq))
        _v6 = _v5.stamp
        _x = _v6
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = _v5.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.pack('<I%ss'%length, length, _x))
        _x = val1
        buff.write(_get_struct_3BdB3d().pack(_x.technology, _x.manufacturer, _x.mpn, _x.raw, _x.raw_units, _x.raw_air, _x.calib_A, _x.calib_B))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.sensors is None:
        self.sensors = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.sensors = []
      for i in range(0, length):
        val1 = olfaction_msgs.msg.gas_sensor()
        _v7 = val1.header
        start = end
        end += 4
        (_v7.seq,) = _get_struct_I().unpack(str[start:end])
        _v8 = _v7.stamp
        _x = _v8
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          _v7.frame_id = str[start:end].decode('utf-8')
        else:
          _v7.frame_id = str[start:end]
        _x = val1
        start = end
        end += 36
        (_x.technology, _x.manufacturer, _x.mpn, _x.raw, _x.raw_units, _x.raw_air, _x.calib_A, _x.calib_B,) = _get_struct_3BdB3d().unpack(str[start:end])
        self.sensors.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_3BdB3d = None
def _get_struct_3BdB3d():
    global _struct_3BdB3d
    if _struct_3BdB3d is None:
        _struct_3BdB3d = struct.Struct("<3BdB3d")
    return _struct_3BdB3d
