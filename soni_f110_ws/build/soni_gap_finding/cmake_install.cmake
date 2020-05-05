# Install script for directory: /home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/src/soni_gap_finding

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/install")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/soni_gap_finding/msg" TYPE FILE FILES "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/src/soni_gap_finding/msg/lidar_gaps.msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/soni_gap_finding/cmake" TYPE FILE FILES "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/soni_gap_finding/catkin_generated/installspace/soni_gap_finding-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/soni_gap_finding/catkin_generated/installspace/soni_gap_finding.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/soni_gap_finding/cmake" TYPE FILE FILES "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/soni_gap_finding/catkin_generated/installspace/soni_gap_finding-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/soni_gap_finding/cmake" TYPE FILE FILES
    "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/soni_gap_finding/catkin_generated/installspace/soni_gap_findingConfig.cmake"
    "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/soni_gap_finding/catkin_generated/installspace/soni_gap_findingConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/soni_gap_finding" TYPE FILE FILES "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/src/soni_gap_finding/package.xml")
endif()

