#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include <sstream>
#include <vesc_msgs/VescStateStamped.h>


int speed = 0;
bool flag = false;
float average = 0;

void chatterCallback(const vesc_msgs::VescStateStamped::ConstPtr& msg)
{

  ROS_INFO(" Current Velocity: [%f]", msg->state.speed);
  speed = msg->state.speed;
  flag = true;
  }

int main(int argc, char **argv)
{

  ros::init(argc, argv, "soni_average_vesc");

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("/sensors/core", 100, chatterCallback);
  ros::Publisher chatter_pub = n.advertise<std_msgs::Float64>("/average_velocity", 100);
  ros::Rate loop_rate(5);

  int number = 0;
  int list [10] = {0};
  std_msgs::Float64 msgavg;
  while (ros::ok())
  {    
    if (flag == false)
    {
    speed = 0;
    }
    list[number] = speed;
    number = number+1;
    if (number == 10){
    number = 0;
    }
    average = 0;
    for (int i = 0; i<10; i++){
    average = average + list[i];
    }
    average = average/10;
    
	msgavg.data = average;
    
    chatter_pub.publish(msgavg);
	flag = false;
    

  
  loop_rate.sleep();
  ros::spinOnce();
  }

  return 0;
}


