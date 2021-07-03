## small ros-based tools ##

- extract images from rosbag

```bash
roslaunch ros_tools extract_image_bag_files.launch rosbag_path:=[absolute/path/to/bag/file] image_topic:=[image/topic/to/extract] output_path:=[absolute/output/path/to/save/images]
```

- extract laser scans to pointcloud

```bash
roslaunch ros_tools laserscan_to_pointcloud.launch rosbag_path:=/absolute/path/to/bag/file base_link:=base_link base_scan:=/scan output_path:=/absolute/path/to/pcd/output
```
