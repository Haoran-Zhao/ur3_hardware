#!/usr/bin/env bash

echo "Starting hardware"
source devel/setup.sh
gnome-terminal -- bash -c "sh ./src/ur3_hardware/ROS/script/start_connection.sh;exec bash"
sleep 15
gnome-terminal -- bash -c "sh ./src/ur3_hardware/ROS/script/start_planexecution.sh;exec bash"
sleep 5
gnome-terminal -- bash -c "sh ./src/ur3_hardware/ROS/script/start_rviz.sh;exec bash"
sleep 5
rosrun robot_controller robot_controller | tee /tmp/robot_controller.log#Now kill simulation on exit

script_full_path=$(dirname "$0")
source ${script_full_path}/kill_simulation.sh
