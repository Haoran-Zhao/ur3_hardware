#!/usr/bin/env bash

echo "Starting hardware"
source devel/setup.sh
gnome-terminal -- bash -c "sh ./src/ur3_hardware/ROS/script/start_connection.sh;exec bash"
sleep 15
gnome-terminal -- bash -c "sh ./src/ur3_hardware/ROS/script/start_planexecution.sh;exec bash"
sleep 5
roslaunch ur3_moveit_config moveit_rviz.launch rviz_config:=$(rospack find ur3_moveit_config)/launch/moveit.rviz
#Now kill simulation on exit

script_full_path=$(dirname "$0")
source ${script_full_path}/kill_simulation.sh
