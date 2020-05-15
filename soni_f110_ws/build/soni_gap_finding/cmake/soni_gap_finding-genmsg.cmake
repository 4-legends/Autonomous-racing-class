# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "soni_gap_finding: 1 messages, 0 services")

set(MSG_I_FLAGS "-Isoni_gap_finding:/home/graspinglab/carla-ros-bridge/Paresh-Soni-F110-2020/soni_f110_ws/src/soni_gap_finding/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators

add_custom_target(soni_gap_finding_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/graspinglab/carla-ros-bridge/Paresh-Soni-F110-2020/soni_f110_ws/src/soni_gap_finding/msg/lidar_gaps.msg" NAME_WE)
add_custom_target(_soni_gap_finding_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "soni_gap_finding" "/home/graspinglab/carla-ros-bridge/Paresh-Soni-F110-2020/soni_f110_ws/src/soni_gap_finding/msg/lidar_gaps.msg" ""
)

#
#  langs = 
#


