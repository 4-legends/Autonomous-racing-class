# Install script for directory: /home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/src/f110-skeletons-spring2020/labs/lab_pure_pursuit

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/f110-skeletons-spring2020/labs/lab_pure_pursuit/catkin_generated/installspace/lab_pure_pursuit.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lab_pure_pursuit/cmake" TYPE FILE FILES
    "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/f110-skeletons-spring2020/labs/lab_pure_pursuit/catkin_generated/installspace/lab_pure_pursuitConfig.cmake"
    "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/build/f110-skeletons-spring2020/labs/lab_pure_pursuit/catkin_generated/installspace/lab_pure_pursuitConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/lab_pure_pursuit" TYPE FILE FILES "/home/graspinglab/Autonomous_racing/Paresh-Soni-F110-2020/soni_f110_ws/src/f110-skeletons-spring2020/labs/lab_pure_pursuit/package.xml")
endif()

