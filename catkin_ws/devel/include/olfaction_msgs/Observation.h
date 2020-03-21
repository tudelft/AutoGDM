// Generated by gencpp from file olfaction_msgs/Observation.msg
// DO NOT EDIT!


#ifndef OLFACTION_MSGS_MESSAGE_OBSERVATION_H
#define OLFACTION_MSGS_MESSAGE_OBSERVATION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>

namespace olfaction_msgs
{
template <class ContainerAllocator>
struct Observation_
{
  typedef Observation_<ContainerAllocator> Type;

  Observation_()
    : header()
    , label()
    , position()
    , type(0)
    , gas(0.0)
    , wind()  {
    }
  Observation_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , label(_alloc)
    , position(_alloc)
    , type(0)
    , gas(0.0)
    , wind(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _label_type;
  _label_type label;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef uint8_t _type_type;
  _type_type type;

   typedef float _gas_type;
  _gas_type gas;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _wind_type;
  _wind_type wind;



  enum {
    TYPE_INVALID = 0u,
    TYPE_GAS = 1u,
    TYPE_WIND = 2u,
    TYPE_GAS_WIND = 3u,
  };


  typedef boost::shared_ptr< ::olfaction_msgs::Observation_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::olfaction_msgs::Observation_<ContainerAllocator> const> ConstPtr;

}; // struct Observation_

typedef ::olfaction_msgs::Observation_<std::allocator<void> > Observation;

typedef boost::shared_ptr< ::olfaction_msgs::Observation > ObservationPtr;
typedef boost::shared_ptr< ::olfaction_msgs::Observation const> ObservationConstPtr;

// constants requiring out of line definition

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::olfaction_msgs::Observation_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::olfaction_msgs::Observation_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace olfaction_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'nav_msgs': ['/opt/ros/melodic/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/melodic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/melodic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'olfaction_msgs': ['/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::olfaction_msgs::Observation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::olfaction_msgs::Observation_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::olfaction_msgs::Observation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::olfaction_msgs::Observation_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::olfaction_msgs::Observation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::olfaction_msgs::Observation_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::olfaction_msgs::Observation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "69bade18f26a947c564210f213ae07bf";
  }

  static const char* value(const ::olfaction_msgs::Observation_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x69bade18f26a947cULL;
  static const uint64_t static_value2 = 0x564210f213ae07bfULL;
};

template<class ContainerAllocator>
struct DataType< ::olfaction_msgs::Observation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "olfaction_msgs/Observation";
  }

  static const char* value(const ::olfaction_msgs::Observation_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::olfaction_msgs::Observation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "## TYPE\n"
"uint8 TYPE_INVALID=0\n"
"uint8 TYPE_GAS=1\n"
"uint8 TYPE_WIND=2\n"
"uint8 TYPE_GAS_WIND=3\n"
"\n"
"\n"
"## OBSERVATION\n"
"Header                  header          # timestamp, frame_id\n"
"string                  label           # optional sensor label\n"
"geometry_msgs/Point     position        # sensor pose with regard to frame_id\n"
"uint8                   type		# specify sensor type\n"
"float32                 gas             # gas reading\n"
"geometry_msgs/Vector3   wind            # wind vector\n"
"\n"
"\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::olfaction_msgs::Observation_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::olfaction_msgs::Observation_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.label);
      stream.next(m.position);
      stream.next(m.type);
      stream.next(m.gas);
      stream.next(m.wind);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Observation_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::olfaction_msgs::Observation_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::olfaction_msgs::Observation_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "label: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.label);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "type: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.type);
    s << indent << "gas: ";
    Printer<float>::stream(s, indent + "  ", v.gas);
    s << indent << "wind: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.wind);
  }
};

} // namespace message_operations
} // namespace ros

#endif // OLFACTION_MSGS_MESSAGE_OBSERVATION_H
