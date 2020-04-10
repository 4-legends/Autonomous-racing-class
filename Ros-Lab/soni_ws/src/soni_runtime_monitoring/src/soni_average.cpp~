#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "std_msgs/Float64.h"
#include <sstream>


int speed = 0;
bool flag = false;
float average = 0;

void chatterCallback(const geometry_msgs::Twist& msg)
{
  ROS_INFO("I heard velocity");
  speed = msg.linear.x;
  flag = true;
  }

int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "soni_average");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The subscribe() call is how you tell ROS that you want to receive messages
   * on a given topic.  This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing.  Messages are passed to a callback function, here
   * called chatterCallback.  subscribe() returns a Subscriber object that you
   * must hold on to until you want to unsubscribe.  When all copies of the Subscriber
   * object go out of scope, this callback will automatically be unsubscribed from
   * this topic.
   *
   * The second parameter to the subscribe() function is the size of the message
   * queue.  If messages are arriving faster than they are being processed, this
   * is the number of messages that will be buffered up before beginning to throw
   * away the oldest ones.
   */
    ros::Subscriber sub = n.subscribe("/turtle1/cmd_vel", 100, chatterCallback);
	ros::Publisher chatter_pub = n.advertise<std_msgs::Float64>("/average_velocity", 100);
	ros::Rate loop_rate(5);
  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
  //int count = 0;
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
    //ROS_INFO("I heard velocity[%f]", average);
	msgavg.data = average;
    /**
     * The publish() function is how you send messages. The parameter
     * is the message object. The type of this object must agree with the type
     * given as a template parameter to the advertise<>() call, as was done
     * in the constructor above.
     */
    chatter_pub.publish(msgavg);
	flag = false;
    
    //++count;
  
  loop_rate.sleep();
  ros::spinOnce();
  }
 // ros::spin();
  return 0;
}


