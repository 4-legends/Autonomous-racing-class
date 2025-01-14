#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "std_msgs/Float64.h"
#include <sstream>


int speed = 0;
bool flag = false;
float average = 0;

void chatterCallback(const geometry_msgs::Twist::ConstPtr& msg)
{

  ROS_INFO(" X velocity: [%f]", msg->linear.x);
  speed = msg->linear.x;
  flag = true;
  }

int main(int argc, char **argv)
{
  ros::init(argc, argv, "soni_average");
  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("/turtle1/cmd_vel", 100, chatterCallback);
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


