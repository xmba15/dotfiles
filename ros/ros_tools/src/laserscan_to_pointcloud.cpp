/**
 * @file    laserscan_to_pointcloud.cpp
 *
 * @author  btran
 *
 */

#include "laserscan_to_pointcloud.hpp"
#include <pcl_ros/point_cloud.h>

namespace utils
{
LaserScanToPointCloud::LaserScanToPointCloud(ros::NodeHandle& nh, ros::NodeHandle& pnh)
    : m_laserScanSub(pnh.subscribe("base_scan", 10, &LaserScanToPointCloud::onLaserScan, this))
    , m_cloudPub(nh.advertise<sensor_msgs::PointCloud2>("base_cloud", 1))
{
    pnh.param<std::string>("base_link", m_param.baseLink, m_param.baseLink);
}

void LaserScanToPointCloud::onLaserScan(const sensor_msgs::LaserScan::ConstPtr& scanMsg)
{
    if (!m_listener.waitForTransform(scanMsg->header.frame_id, m_param.baseLink,
                                     scanMsg->header.stamp +
                                         ros::Duration().fromSec(scanMsg->ranges.size() * scanMsg->time_increment),
                                     ros::Duration(1.0))) {
        return;
    }

    sensor_msgs::PointCloud2 cloudMsg;

    m_projector.transformLaserScanToPointCloud(m_param.baseLink, *scanMsg, cloudMsg, m_listener,
                                               laser_geometry::channel_option::Default);

    // simple trick to output only x,y,z without any other channels
    // pcl::PointCloud<pcl::PointXYZ> cloud;
    // pcl::fromROSMsg(cloudMsg, cloud);
    // pcl::toROSMsg(cloud, cloudMsg);

    m_cloudPub.publish(cloudMsg);
}
}  // namespace utils
