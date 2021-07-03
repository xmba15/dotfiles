/**
 * @file    laserscan_to_pointcloud.hpp
 *
 * @author  btran
 *
 */

#pragma once

#include <laser_geometry/laser_geometry.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud.h>
#include <tf/transform_listener.h>

namespace utils
{
class LaserScanToPointCloud
{
 public:
    struct Param {
        std::string baseLink = "/base_link";
    };

    LaserScanToPointCloud(ros::NodeHandle& nh, ros::NodeHandle& pnh);

 private:
    void onLaserScan(const sensor_msgs::LaserScan::ConstPtr& scanMsg);

 private:
    Param m_param;

    ros::Subscriber m_laserScanSub;
    tf::TransformListener m_listener;
    laser_geometry::LaserProjection m_projector;

    ros::Publisher m_cloudPub;
};
}  // namespace utils
