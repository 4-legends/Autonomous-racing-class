#!/usr/bin/env python

import rospy
from std_msgs.msg import Float64
import tf
import pandas as pd 
from nav_msgs.msg import Path, Odometry
from geometry_msgs.msg import PoseStamped

waypoint_pub = rospy.Publisher('/waypoints', Path, queue_size=1)
path = []
waypoints = Path()

def sensorcallback(data):
	global path
	global waypoints
	x = data.pose.position.x
	y = data.pose.position.y
	quaternion = data.pose.orientation
	quat = [quaternion.x, quaternion.y, quaternion.z, quaternion.w]
	theta = tf.transformations.euler_from_quaternion(quat)[2]
	path.append((x,y,theta))
	waypoints.header.stamp = rospy.Time.now()
	waypoints.header.frame_id = "map"
	waypoints.poses.append(data)
	waypoint_pub.publish(waypoints)

def save_csv():
	global path
	df = pd.DataFrame(path, columns=['x', 'y', 'theta'])
	df.to_csv('waypoints_saver.csv')

if __name__ == '__main__':
	rospy.init_node('waypoints_saver', anonymous=True)
	pf_sub = rospy.Subscriber('/pf/viz/inferred_pose', PoseStamped, sensorcallback)
	#pf_sub = rospy.Subscriber('/pf/pose/odom', Odometry, sensorcallback)
	rospy.spin()
	rospy.on_shutdown(save_csv)


