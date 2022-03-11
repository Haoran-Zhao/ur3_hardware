#!/usr/bin/env bash

echo "Starting connection"
source devel/setup.sh
roslaunch ur_robot_driver ur3_bringup.launch robot_ip:=192.168.1.5 kinematics_config:=$(rospack find ur_calibration)/config/ur3_calibration.yaml
