#!/usr/bin/env python

import rospy
from race.msg import drive_param
from soni_gap_finding.msg import lidar_gaps
from std_msgs.msg import Float64
from sensor_msgs.msg import LaserScan
import numpy as np
from geometry_msgs.msg import Vector3
np.set_printoptions(threshold=np.inf)

#from sklearn.cluster import DBSCAN

#this publishes the drive command to run the car.
drive_pub = rospy.Publisher('drive_parameters', drive_param, queue_size=1)

#this publishes the center of the gap in(x,y,z) coordinate system
gap_center_pub = rospy.Publisher("gap_center", Vector3, queue_size=1)


gap_pub = rospy.Publisher("lidar_gaps", lidar_gaps, queue_size=1)
#Implement your own message to publish relevant information about gaps
#gaps_pub = rospy.Publisher("gaps", <your message type>, queue_size=1)

# Callback that receives LIDAR data on the /scan topic.
# data: the LIDAR data, published as sensor_msgs::LaserScan
def scan_callback(data):
	#Implement some clustering algorithm(e.g K-means,DBSCAN,your own custom algorithm) to cluster points and find possible gaps
    #Publish the center of the gaps as well as the endpoints of the gaps.
	#angle_min = np.rad2deg(data.angle_min)
	#angle_max = np.rad2deg(data.angle_max)
	angle_diff = data.angle_increment
	range_min = data.range_min
	ranges = np.asarray(data.ranges)

	for i in range(len(ranges)):
		if ranges[i] <= 1.5:
			ranges[i] = 0
	
	##############
	##Clustering##
	##############
	Num_Cluster = 0
	len_cluster = []
	Clusters = []
	cluster_center = []
	distance = 0.1
	count = True
	i = 0
	while count:
		cluster_local = []
		cluster_local.append(i)
		while (abs(ranges[i]-ranges[i+1]) <= distance):
			cluster_local.append(i+1)
			i += 1
			if i >= len(ranges)-1:
				break
		i += 1
		minimum = int(3/np.rad2deg(angle_diff))
		maximum = int(90/np.rad2deg(angle_diff))

		#Lidar Step size is 0.25 degree considering minimum 3 degree and 45 degree maximum  
		if len(cluster_local) >= minimum and len(cluster_local) <= maximum:
			Clusters.append(cluster_local)
			gap_pub.publish(cluster_local)
			Num_Cluster += 1
			len_cluster.append(len(cluster_local))
			cluster_center.append(int(len(cluster_local)/2))
		if i >= len(ranges)-1:
			break
	temp = 0
	clus_num = 0
	clus_cen_index = 540
	for j in range(Num_Cluster):
		clus1 = Clusters[j]
		clus_cen_index = clus1[cluster_center[j]]
		if temp < ranges[clus_cen_index]:
			temp = ranges[clus_cen_index]
			clus_num = j
			
	pos = clus_cen_index - 540
	
	angle = angle_diff*pos
	gap = Vector3()
	gap.x = np.sin(angle)*temp
	gap.y = np.cos(angle)*temp
	gap.z = 0
	
	gap_center_pub.publish(gap)
	#clustering = DBSCAN(eps=0.1, min_samples=2).fit(ranges)
	#rospy.loginfo("Clusters" +str(Clusters))

    #Based on the center of the gap, you can also implement a simple PID controller to follow it. Be careful about the lookahead distance you use.
	msg = drive_param()
	msg.velocity = 0.1  # TODO: implement PID for velocity
	msg.angle = 0.0    # TODO: implement PID for steering angle
	drive_pub.publish(msg)


# Boilerplate code to start this ROS node.
if __name__ == '__main__':
	rospy.init_node('gap_finding_node', anonymous=True)
	rospy.Subscriber("scan", LaserScan, scan_callback)
	rospy.spin()

