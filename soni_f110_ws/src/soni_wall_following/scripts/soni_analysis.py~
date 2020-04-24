#!/usr/bin/env python

import rospy
import math
import numpy as np
import yaml
import sys
from soni_wall_following.msg import analysis
from std_msgs.msg import Float64
import pdb

pub = rospy.Publisher('wall_following_analysis', analysis, queue_size=10)
avg_sum = 0
max_error = 0
count =1
def error_callback(data):
  global avg_sum
  global max_eror
  global count
  error = msg.data
  avg_sum = avg+error
  avg = avg_sum/count
  if error > max_error:
  	max_error = error
  msg.avg_error = avg
  msg.max_error = max_error
  pub.publish(msg)
  count += 1


if __name__ == '__main__':
	rospy.init_node('soni_wall_following_analysis', anonymous = True)
	rospy.Subscriber("pid_error", Float64, error_callback)
	rospy.spin()
