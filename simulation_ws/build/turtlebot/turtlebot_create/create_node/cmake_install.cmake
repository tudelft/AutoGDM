# Install script for directory: /home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/bart/CFD_pipeline/simulation_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/bart/CFD_pipeline/simulation_ws/build/turtlebot/turtlebot_create/create_node/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/create_node/msg" TYPE FILE FILES
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/msg/BatteryState.msg"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/msg/Drive.msg"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/msg/RawTurtlebotSensorState.msg"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/msg/RoombaSensorState.msg"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/msg/Turtle.msg"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/msg/TurtlebotSensorState.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/create_node/srv" TYPE FILE FILES
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/srv/SetDigitalOutputs.srv"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/srv/SetTurtlebotMode.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/create_node/cmake" TYPE FILE FILES "/home/bart/CFD_pipeline/simulation_ws/build/turtlebot/turtlebot_create/create_node/catkin_generated/installspace/create_node-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/bart/CFD_pipeline/simulation_ws/devel/include/create_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/bart/CFD_pipeline/simulation_ws/devel/share/roseus/ros/create_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/bart/CFD_pipeline/simulation_ws/devel/share/common-lisp/ros/create_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/bart/CFD_pipeline/simulation_ws/devel/share/gennodejs/ros/create_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/bart/CFD_pipeline/simulation_ws/devel/lib/python2.7/dist-packages/create_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/bart/CFD_pipeline/simulation_ws/devel/lib/python2.7/dist-packages/create_node" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/bart/CFD_pipeline/simulation_ws/devel/lib/python2.7/dist-packages/create_node" FILES_MATCHING REGEX "/home/bart/CFD_pipeline/simulation_ws/devel/lib/python2.7/dist-packages/create_node/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/create_node" TYPE FILE FILES "/home/bart/CFD_pipeline/simulation_ws/devel/include/create_node/TurtleBotConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/bart/CFD_pipeline/simulation_ws/devel/lib/python2.7/dist-packages/create_node/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/create_node" TYPE DIRECTORY FILES "/home/bart/CFD_pipeline/simulation_ws/devel/lib/python2.7/dist-packages/create_node/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/bart/CFD_pipeline/simulation_ws/build/turtlebot/turtlebot_create/create_node/catkin_generated/installspace/create_node.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/create_node/cmake" TYPE FILE FILES "/home/bart/CFD_pipeline/simulation_ws/build/turtlebot/turtlebot_create/create_node/catkin_generated/installspace/create_node-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/create_node/cmake" TYPE FILE FILES
    "/home/bart/CFD_pipeline/simulation_ws/build/turtlebot/turtlebot_create/create_node/catkin_generated/installspace/create_nodeConfig.cmake"
    "/home/bart/CFD_pipeline/simulation_ws/build/turtlebot/turtlebot_create/create_node/catkin_generated/installspace/create_nodeConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/create_node" TYPE FILE FILES "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/create_node" TYPE PROGRAM FILES
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/scripts/kinect_breaker_enabler.py"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/scripts/load_calib.py"
    "/home/bart/CFD_pipeline/simulation_ws/src/turtlebot/turtlebot_create/create_node/nodes/turtlebot_node.py"
    )
endif()

