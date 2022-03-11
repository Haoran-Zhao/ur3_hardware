#!/usr/bin/env bash

echo "Starting ur3_moveit_planning_execution"
source devel/setup.bash
echo "find package"
rospack find ur3_moveit_config
echo "run roslaunch"
roslaunch ur3_moveit_config ur3_moveit_planning_execution.launch
#roslaunch ./src/ur3_hardware/ROS/robot_moveit_config/ur3_moveit_config/launch/ur3_moveit_planning_execution.launch
