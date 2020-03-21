// Generated by gencpp from file gaden_player/GasPositionResponse.msg
// DO NOT EDIT!


#ifndef GADEN_PLAYER_MESSAGE_GASPOSITIONRESPONSE_H
#define GADEN_PLAYER_MESSAGE_GASPOSITIONRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace gaden_player
{
template <class ContainerAllocator>
struct GasPositionResponse_
{
  typedef GasPositionResponse_<ContainerAllocator> Type;

  GasPositionResponse_()
    : gas_conc()
    , gas_type()  {
    }
  GasPositionResponse_(const ContainerAllocator& _alloc)
    : gas_conc(_alloc)
    , gas_type(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _gas_conc_type;
  _gas_conc_type gas_conc;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _gas_type_type;
  _gas_type_type gas_type;





  typedef boost::shared_ptr< ::gaden_player::GasPositionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gaden_player::GasPositionResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GasPositionResponse_

typedef ::gaden_player::GasPositionResponse_<std::allocator<void> > GasPositionResponse;

typedef boost::shared_ptr< ::gaden_player::GasPositionResponse > GasPositionResponsePtr;
typedef boost::shared_ptr< ::gaden_player::GasPositionResponse const> GasPositionResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gaden_player::GasPositionResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gaden_player::GasPositionResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace gaden_player

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gaden_player::GasPositionResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gaden_player::GasPositionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gaden_player::GasPositionResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "16b1b92923412b5b6f4abfca890a54a0";
  }

  static const char* value(const ::gaden_player::GasPositionResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x16b1b92923412b5bULL;
  static const uint64_t static_value2 = 0x6f4abfca890a54a0ULL;
};

template<class ContainerAllocator>
struct DataType< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gaden_player/GasPositionResponse";
  }

  static const char* value(const ::gaden_player::GasPositionResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] gas_conc\n"
"string[] gas_type\n"
"\n"
;
  }

  static const char* value(const ::gaden_player::GasPositionResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.gas_conc);
      stream.next(m.gas_type);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GasPositionResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gaden_player::GasPositionResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gaden_player::GasPositionResponse_<ContainerAllocator>& v)
  {
    s << indent << "gas_conc[]" << std::endl;
    for (size_t i = 0; i < v.gas_conc.size(); ++i)
    {
      s << indent << "  gas_conc[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.gas_conc[i]);
    }
    s << indent << "gas_type[]" << std::endl;
    for (size_t i = 0; i < v.gas_type.size(); ++i)
    {
      s << indent << "  gas_type[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.gas_type[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // GADEN_PLAYER_MESSAGE_GASPOSITIONRESPONSE_H
