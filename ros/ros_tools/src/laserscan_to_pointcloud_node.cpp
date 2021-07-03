/**
 * @file    laserscan_to_pointcloud_node.cpp
 *
 * @author  btran
 *
 */

#include "laserscan_to_pointcloud.hpp"

int main(int argc, char* argv[])
{
    ros::init(argc, argv, "laserscan_to_pointcloud");

    ros::NodeHandle nh;
    ros::NodeHandle pnh("~");

    try {
        utils::LaserScanToPointCloud node(nh, pnh);
        ros::spin();
    } catch (const std::exception& ex) {
        ROS_ERROR_STREAM("Exception in main(): " << ex.what());
        return EXIT_FAILURE;
    } catch (...) {
        ROS_ERROR_STREAM("Unknown exception in main()");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
