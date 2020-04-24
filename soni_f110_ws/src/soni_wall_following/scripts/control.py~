#!/usr/bin/env python

import rospy
from race.msg import drive_param
from std_msgs.msg import Float64
import numpy as np
import math

# TODO: modify these constants to make the car follow walls smoothly.
KP = 100
KD = 0.0

pub = rospy.Publisher('drive_parameters', drive_param, queue_size=1)

# Callback for receiving PID error data on the /pid_error topic
# data: the PID error from pid_error_node, published as a Float64
DP = 0
def control_callback(msg):
  # TODO: Based on the error (msg.data), determine the car's required velocity
  # amd steering angle.
	global DP
	
	error = msg.data
	pid_output = KP*error + KD*(error-DP)   #TODO: compute pid response for steering angle based on the error
  	DP = error
	if abs(pid_output) < 11:
  		vel =1.5
  	elif abs(pid_output) < 21:
  		vel =1
  	else:
  		vel =0.5 #TODO: compute velocity based on the steering angle response. Remember you need to slow down accordingly based on how much you turn.	

  	angle = math.radians(pid_output)    #convert the angle to radians if not already in radians
	angle = np.clip(angle, -0.4189, 0.4189)  # 0.4189 radians = 24 degrees because car can only turn 24 degrees max
	if error ==0:
		vel = -vel
		angle = 0
	msg = drive_param()
	msg.velocity = vel  # TODO: implement PID for velocity
	msg.angle = angle    # TODO: implement PID for steering angle
	pub.publish(msg)

	


# Boilerplate code to start this ROS node.
if __name__ == '__main__':
	rospy.init_node('pid_controller_node', anonymous=True)
	rospy.Subscriber("pid_error", Float64, control_callback)
	rospy.spin()

