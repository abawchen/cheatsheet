# ROS

---

### Install ROS on Ubuntu 18.04

```bash
$ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

$ sudo -E  apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

$ sudo apt update
```

```bash
$ sudo apt-get install ros-melodic-desktop-full
```

---

### References:

- http://wiki.ros.org/ROS/Tutorials
- https://www.itread01.com/content/1555151005.html
- http://answers.ros.org/question/325039/apt-update-fails-cannot-install-pkgs-key-not-working/
