# UR3 hardware implementation with exsiting project

This work is to integrate the developed previous work in the simulation with the UR3 hardware.

## Quick start
. Open a ROS terminal, cd to ros_workspace
. To run execute following command to start the connection of the UR3
```
$ ./src/ur3_hardware/ROS/script/start_hardware.sh
```
. After run the script, there will be two more terminal open, the first terminal is to connect the ur3 with the ip address. The ip address should be changed accordingly.
. After see the following in the first terminal
```
[INFO] [1647033533.408816]: Controller Spawner: Waiting for service controller_manager/switch_controller
[INFO] [1647033533.413885]: Controller Spawner: Waiting for service controller_manager/switch_controller
[INFO] [1647033533.415152]: Controller Spawner: Waiting for service controller_manager/unload_controller
[INFO] [1647033533.421855]: Controller Spawner: Waiting for service controller_manager/unload_controller
[INFO] [1647033533.423474]: Loading controller: joint_state_controller
[INFO] [1647033533.431071]: Loading controller: pos_joint_traj_controller
[INFO] [1647033533.450758]: Loading controller: scaled_pos_joint_traj_controller
[INFO] [1647033533.538547]: Loading controller: joint_group_vel_controller
[INFO] [1647033533.585925]: Loading controller: speed_scaling_state_controller
[INFO] [1647033533.594120]: Controller Spawner: Loaded controllers: pos_joint_traj_controller, joint_group_vel_controller
[INFO] [1647033533.602328]: Loading controller: force_torque_sensor_controller
[INFO] [1647033533.610064]: Controller Spawner: Loaded controllers: joint_state_controller, scaled_pos_joint_traj_controller, speed_scaling_state_controller, force_torque_sensor_controller
[INFO] [1647033533.617980]: Started controllers: joint_state_controller, scaled_pos_joint_traj_controller, speed_scaling_state_controller, force_torque_sensor_controller
```
. Start the external control, click the play button on teaching pandent of UR3. Then you can see following which means the connection is established.
```
[ INFO] [1647033636.184471492]: Robot requested program
[ INFO] [1647033636.184726109]: Sent program to robot
[ INFO] [1647033636.855450259]: Robot connected to reverse interface. Ready to receive control commands.
```
.Waiting until the rviz is successfully launched.

. Open another ROS terminal, cd to ros_workspace
. To run execute following command
```
$ ./src/ur3_hardware/ROS/script/start_servo.sh
```
## System Configuration

### Hardware Configuration

. A standard PC.

### Software Configuration

. Ubuntu [18.04 LTS, Melodic] as Host OS.

## Ubuntu [18.04 LTS, Melodic]

### ROS Setup

. Install ROS melodic by following the instruction found in the official website here (Install all tools):
 http://wiki.ros.org/melodic/Installation/Ubuntu<br/>
. Install caktin tools by following the instruction found in the official website here:
https://catkin-tools.readthedocs.io/en/latest/installing.html<br/>
. Install moveit by following the instruction found in the official website here:
https://moveit.ros.org/install/<br/>
. Install Eigen 3 (math library), using command
```
$ sudo apt install libeigen3-dev
```
. Install ros-control using command:
```
$ sudo apt-get install ros-melodic-ros-control
```
. install ros-controller using command:
```
$ sudo apt-get install ros-melodic-ros-controllers
```
### Universal Robot Controller
. The source code and installation instruction can be found at https://github.com/UniversalRobots/Universal_Robots_ROS_Driver<br/>
. Setting instructions can be found in the subsection "Setting up a UR robot for ur_robot_driver"<br/>
. Usage can be found at https://github.com/UniversalRobots/Universal_Robots_ROS_Driver/blob/master/ur_robot_driver/doc/usage_example.md

### previous work code modification
.Replace the "ur_description folder" and "ur3_moveit_config" folder with official files found at https://github.com/fmauch/universal_robot.git src/fmauch_universal_robot

.In [RobotController.cpp](ROS/robot_controller/src/RobotController.cpp) change line 85 to 
```
 _joint_pub = _node_handle->advertise<trajectory_msgs::JointTrajectory>("/scaled_pos_joint_traj_controller/command", 1);<br/>
```
. change line 145 to
```
 _move_group_ptr->setNamedTarget("home");
```
. Modify the home position in [ur3.srdf](ROS/robot_moveit_config/ur3_moveit_config/config/ur3.srdf) from line 19 to line 25 <br/>

### Download and install Ruckig
. Install Ruckig OTG libray by following the instruction found in the official github:
https://github.com/pantor/ruckig

. Install Ruckig in a system system-wide directory
```
$ sudo make install
```
### ROS Setup

. Install visual studio - 2019 community version if not installed
. Install ROS for windows as described in the following link:
http://wiki.ros.org/Installation/Windows
. Install moveit for windows as described in the following link:
https://moveit.ros.org/install/
. The above step install all dependencies as well as gazebo
. Create ROS  commandline terminal shortcut as in step 2
. Install Win10SDK_10.0.18362 from visual studio

### Source download and compilation

. Clone git repository from “https://github.com/Haoran-Zhao/ur3_hardware.git” or using command :
```
$ git clone https://github.com/Haoran-Zhao/ur3_hardware.git
```
. Source code is present in "ur3_hardware" folder.
. Build and compile the project using CMake and Visual Studio.
