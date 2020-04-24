#!/usr/bin/env python

import rospy
import math
import numpy as np
import yaml
import sys
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float64
import pdb

pub = rospy.Publisher('pid_error', Float64, queue_size=10)

# You can define constants in Python as uppercase global names like these.
MIN_DISTANCE = 0.1
MAX_DISTANCE = 30.0
MIN_ANGLE = -45.0
MAX_ANGLE = 225.0

# data: single message from topic /scan
# angle: between -45 to 225 degrees, where 0 degrees is directly to the right
# Outputs length in meters to object with angle in lidar scan field of view
def getRange(data, angle):
  # TODO: implement
  #Laser scan angle increment is 0.25 deg
  scan1 = 0.25
  L = 0.5
  Zerodeg = int(45/scan1)
  right2 = int(angle/scan1)
  left180 = int(180/scan1)
  left2 = int((180-angle)/scan1)
  
  radangle = np.deg2rad(angle)
  if data[right2] < 11 or data[left2] < 11:
  	alphar = np.arctan((data[right2]*np.cos(radangle) - data[Zerodeg])/(data[right2]*np.sin(radangle)))
  	alphal = np.arctan((data[left2]*np.cos(radangle) - data[left180])/(data[left2]*np.sin(radangle)))
  
  	Dtr = data[Zerodeg]*np.cos(alphar)
  	Dtl = data[left180]*np.cos(alphal)
  
  	right = Dtr + L*np.sin(alphar)
  	left  = Dtl + L*np.sin(alphal)
  else:
  	left = 0
  	right = 0
  return left, right

# data: single message from topic /scan
# desired_distance: desired distance to the left wall [meters]
# Outputs the PID error required to make the car follow the left wall.
def followLeft(data, desired_distance):
  # TODO: implement
  error = desired_distance - data
  return error

# data: single message from topic /scan
# desired_distance: desired distance to the right wall [meters]
# Outputs the PID error required to make the car follow the right wall.
def followRight(data, desired_distance):
  # TODO: implement
  error = data - desired_distance
  return error

# data: single message from topic /scan
# Outputs the PID error required to make the car drive in the middle
# of the hallway.
def followCenter(left, right):
  # TODO: implement
  error = right - left
  return error

# Callback for receiving LIDAR data on the /scan topic.
# data: the LIDAR data, published as a list of distances to the wall.
def scan_callback(data):
  d_dist = 1
  angle = 45
  left, right = getRange(data.ranges, angle)
  if left !=0 and right !=0:
	  follow_wall = rospy.get_param("follow_wall")
	  if follow_wall == 'left':
	  	error = followLeft(left,d_dist) # TODO: replace with followLeft, followRight, or followCenter
	  elif follow_wall == 'right':
	  	error = followRight(right,d_dist)
	  elif follow_wall == 'center':
	  	error = followCenter(left, right)
  else:
  	error = 0
  msg = Float64()
  msg.data = error
  pub.publish(msg)

# Boilerplate code to start this ROS node.
# DO NOT MODIFY!
if __name__ == '__main__':
	rospy.init_node('pid_error_node', anonymous = True)
	rospy.Subscriber("scan", LaserScan, scan_callback)
	rospy.spin()
