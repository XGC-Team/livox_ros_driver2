#!/usr/bin/env bash
set -euo pipefail

source /opt/ros/noetic/setup.bash

rospack find livox_ros_driver2 >/dev/null
test -x /opt/ros/noetic/lib/livox_ros_driver2/livox_ros_driver2_node
test -f /opt/ros/noetic/include/livox_ros_driver2/CustomMsg.h
test -f /opt/ros/noetic/share/livox_ros_driver2/launch_ROS1/msg_MID360.launch
test -f /opt/ros/noetic/share/livox_ros_driver2/config/MID360_config.json

echo "Installed package check passed"
