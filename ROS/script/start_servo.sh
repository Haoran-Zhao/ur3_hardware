#!/usr/bin/env bash

echo "Starting Simulation"
source devel/setup.sh
roslaunch moveit_servo start_servo_server.launch
#Now kill simulation on exit
script_full_path=$(dirname "$0")
source ${script_full_path}/kill_simulation.sh
