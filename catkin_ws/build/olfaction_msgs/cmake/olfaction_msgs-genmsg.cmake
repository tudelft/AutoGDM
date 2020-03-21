# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "olfaction_msgs: 4 messages, 1 services")

set(MSG_I_FLAGS "-Iolfaction_msgs:/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/melodic/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(olfaction_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg" NAME_WE)
add_custom_target(_olfaction_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "olfaction_msgs" "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg" NAME_WE)
add_custom_target(_olfaction_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "olfaction_msgs" "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv" NAME_WE)
add_custom_target(_olfaction_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "olfaction_msgs" "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv" "nav_msgs/Odometry:geometry_msgs/TwistWithCovariance:geometry_msgs/Twist:geometry_msgs/Vector3:geometry_msgs/Pose:geometry_msgs/PoseWithCovariance:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg" NAME_WE)
add_custom_target(_olfaction_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "olfaction_msgs" "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg" "olfaction_msgs/gas_sensor:std_msgs/Header"
)

get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg" NAME_WE)
add_custom_target(_olfaction_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "olfaction_msgs" "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg" "geometry_msgs/Vector3:geometry_msgs/Point:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_cpp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_cpp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg"
  "${MSG_I_FLAGS}"
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_cpp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs
)

### Generating Services
_generate_srv_cpp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs
)

### Generating Module File
_generate_module_cpp(olfaction_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(olfaction_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(olfaction_msgs_generate_messages olfaction_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_cpp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_cpp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_cpp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_cpp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_cpp _olfaction_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(olfaction_msgs_gencpp)
add_dependencies(olfaction_msgs_gencpp olfaction_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS olfaction_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_eus(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_eus(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg"
  "${MSG_I_FLAGS}"
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_eus(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs
)

### Generating Services
_generate_srv_eus(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs
)

### Generating Module File
_generate_module_eus(olfaction_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(olfaction_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(olfaction_msgs_generate_messages olfaction_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_eus _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_eus _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_eus _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_eus _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_eus _olfaction_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(olfaction_msgs_geneus)
add_dependencies(olfaction_msgs_geneus olfaction_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS olfaction_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_lisp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_lisp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg"
  "${MSG_I_FLAGS}"
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_lisp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs
)

### Generating Services
_generate_srv_lisp(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs
)

### Generating Module File
_generate_module_lisp(olfaction_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(olfaction_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(olfaction_msgs_generate_messages olfaction_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_lisp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_lisp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_lisp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_lisp _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_lisp _olfaction_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(olfaction_msgs_genlisp)
add_dependencies(olfaction_msgs_genlisp olfaction_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS olfaction_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_nodejs(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_nodejs(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg"
  "${MSG_I_FLAGS}"
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_nodejs(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs
)

### Generating Services
_generate_srv_nodejs(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs
)

### Generating Module File
_generate_module_nodejs(olfaction_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(olfaction_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(olfaction_msgs_generate_messages olfaction_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_nodejs _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_nodejs _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_nodejs _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_nodejs _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_nodejs _olfaction_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(olfaction_msgs_gennodejs)
add_dependencies(olfaction_msgs_gennodejs olfaction_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS olfaction_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_py(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_py(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg"
  "${MSG_I_FLAGS}"
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs
)
_generate_msg_py(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs
)

### Generating Services
_generate_srv_py(olfaction_msgs
  "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs
)

### Generating Module File
_generate_module_py(olfaction_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(olfaction_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(olfaction_msgs_generate_messages olfaction_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_py _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/anemometer.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_py _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/srv/suggestNextObservationLocation.srv" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_py _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/gas_sensor_array.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_py _olfaction_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bart/CFD_pipeline/catkin_ws/src/olfaction_msgs/msg/Observation.msg" NAME_WE)
add_dependencies(olfaction_msgs_generate_messages_py _olfaction_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(olfaction_msgs_genpy)
add_dependencies(olfaction_msgs_genpy olfaction_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS olfaction_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/olfaction_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(olfaction_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(olfaction_msgs_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/olfaction_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(olfaction_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(olfaction_msgs_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/olfaction_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(olfaction_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(olfaction_msgs_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/olfaction_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(olfaction_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(olfaction_msgs_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/olfaction_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(olfaction_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(olfaction_msgs_generate_messages_py nav_msgs_generate_messages_py)
endif()
