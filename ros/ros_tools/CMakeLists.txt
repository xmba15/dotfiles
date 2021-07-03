cmake_minimum_required(VERSION 3.10)
project(ros_tools)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  sensor_msgs
  laser_geometry
)

find_package(PCL REQUIRED)

catkin_package(
)

add_executable(laserscan_to_pointcloud_node
  src/laserscan_to_pointcloud.cpp
  src/laserscan_to_pointcloud_node.cpp
)
target_include_directories(laserscan_to_pointcloud_node
  SYSTEM PUBLIC
    ${catkin_INCLUDE_DIRS}
    ${PCL_INCLUDE_DIRS}
)
target_link_libraries(laserscan_to_pointcloud_node
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
)
