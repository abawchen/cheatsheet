## Mac ssh to Ubuntu with X11 in iterm2

- Install [XQuartz](https://uisapp2.iu.edu/confluence-prd/pages/viewpage.action?pageId=280461906)

  ```bash
  $ export DISPLAY=:0
  $ ssh -X {hostname}
  ```

## [Check Ubuntu version](https://linuxize.com/post/how-to-check-your-ubuntu-version/#targetText=Open%20your%20terminal%20either%20by,to%20display%20the%20Ubuntu%20version.&targetText=Your%20Ubuntu%20version%20will%20be,am%20using%20Ubuntu%2018.04%20LTS.)

  ```bash
  $ lsb_release -a
  ```
## Disk space

- [Get size of a directory](https://dotblogs.com.tw/newmonkey48/2012/12/07/85471)

  ```bash
  $ du -sh directory_name
  ```

## User/Group management

- [Find group id by name](https://askubuntu.com/a/639997/824819)
  
  ```bash
  # Replace sudo with target group name
  $ getent group sudo | awk -F: '{printf "Group %s with GID=%d\n", $1, $3}'\n
  $ cut -d: -f3 < <(getent group sudo)
  ```

- List all users

  ```bash
  $ cat /etc/passwd
  ```

- List current user's groups

  ```bash
  $ groups
  ```

- Add a new group

  ```bash
  $ sudo groupadd mynewgroup
  ```

- Add user to an existing group
  
  ```bash
  # Add user geek to sudo group
  $ usermod -a -G sudo geek
  ```

## Wrap Python script to *.deb

  ```bash
  # Install
  $ sudo dpkg -i foo.deb
  
  # Check installed
  $ sudo dpkg -L foo.deb
  
  # Remove install
  $ sudo dpkg -r foo

  # Add missing dependencies when using dpkg
  # (https://github.com/jordansissel/fpm/issues/1275#issuecomment-311401078)
  $ sudo apt-get install $(dpkg-deb -f foo.deb Depends | tr , ' ')

  # or https://unix.stackexchange.com/questions/159094/how-to-install-a-deb-file-by-dpkg-i-or-by-apt
  $ sudo apt-get install -f
  ```

## Install Intel wifi driver

  ```bash
  $ sudo lshw -C network
  ```
  
  ```
  *-network UNCLAIMED
       description: Network controller
       product: Intel Corporation
       vendor: Intel Corporation
       physical id: 14.3
       bus info: pci@0000:00:14.3
       version: 10
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress msix cap_list
       configuration: latency=0
       resources: memory:a451c000-a451ffff
  *-network
       description: Ethernet interface
       product: RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
       vendor: Realtek Semiconductor Co., Ltd.
       physical id: 0
       bus info: pci@0000:03:00.0
       logical name: enp3s0
       version: 15
       serial: 18:31:bf:98:0a:38
       size: 1Gbit/s
       capacity: 1Gbit/s
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress msix bus_master cap_list ethernet physical tp mii 10bt 10bt-fd 100bt 100bt-fd 1000bt 1000bt-fd autonegotiation
       configuration: autonegotiation=on broadcast=yes driver=r8169 driverversion=2.3LK-NAPI duplex=full firmware=rtl8168h-2_0.0.2 02/26/15 ip=192.168.15.55 latency=0 link=yes multicast=yes port=MII speed=1Gbit/s
       resources: irq:18 ioport:3000(size=256) memory:a4304000-a4304fff memory:a4300000-a4303fff
   ```


## [NFSv4Howto](https://help.ubuntu.com/community/NFSv4Howto)
  
  ```bash
  $ sudo apt-get install nfs-common
  ```

## Mount on boot

  ```bash
  $ sudo vim /etc/fstab
  $ sudo mount -a
  ```
## Enable network in recovery mode

  - https://askubuntu.com/questions/977450/eth0-error-while-getting-interface-flags-no-such-device
  - https://serverfault.com/questions/21475/starting-network-connection-from-ubuntu-recovery
  - https://askubuntu.com/questions/930871/connect-to-internet-in-recovery-mode

  ```bash
  $ ifconfig -a
  $ ifconfig xxxx up
  $ dhclient xxxx
  $ ping 8.8.8.8
  $ echo "namserver 8.8.8.8" | sudo tee /etc/resolv.conf
  $ ping www.google.com
  ```
## Check NVIDIA spec.
  
  ```bash
  # Driver version
  # https://stackoverflow.com/a/13127714/9041712
  $ cat /proc/driver/nvidia/version
  NVRM version: NVIDIA UNIX x86_64 Kernel Module  410.72  Wed Oct 17 20:08:45 CDT 2018
  GCC version:  gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.10)
  ```

  ```
  # Runtime version
  root@93c47c11a5d0:/# nvcc -V
  nvcc: NVIDIA (R) Cuda compiler driver
  Copyright (c) 2005-2016 NVIDIA Corporation
  Built on Tue_Jan_10_13:22:03_CST_2017
  Cuda compilation tools, release 8.0, V8.0.61
  ```

  ```bash
  $ sudo update-pciids
  $ sudo lspci | grep VGA
  ```
  
  ```
  02:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 1070 Ti] (rev a1)
  08:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30)
  ```

## [Install nvidia-docker2 on ubuntu 18.04](https://github.com/NVIDIA/nvidia-docker/issues/887#issuecomment-447829585)

  ```bash
  $ sudo apt-get remove docker docker-engine docker.io

  $ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    
  $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  $ sudo apt-key fingerprint 0EBFCD88

  $ sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"

  $ sudo apt-get update
  $ sudo apt-get install docker-ce
  $ sudo apt-get install nvidia-docker2
  ```

## [Ubuntu 18.04 stuck on splash screen](https://www.maketecheasier.com/boot-recovery-mode-ubuntu/)

- Press `ESC` & `e` to enter `Ubuntu’s GRUB boot menu`
- Add/Remove nomodeset
  ```
  # or
  sudo vim /etc/default/grub
  ```
- Refs:
  - https://askubuntu.com/questions/38780/how-do-i-set-nomodeset-after-ive-already-installed-ubuntu/38782
  - https://itsfoss.com/fix-ubuntu-freezing/
  - https://www.maketecheasier.com/boot-recovery-mode-ubuntu/

## [Firewall](https://www.peterdavehello.org/2016/01/ubuntu-based-gnulinux-firewall-ufw-essential-config/)

```bash
$ ufw app list
$ ufw allow 'OpenSSH'
$ ufw enable
```

## [Conda for multiple users](https://medium.com/@pjptech/installing-anaconda-for-multiple-users-650b2a6666c6)

```bash
$ sudo su
$ adduser anaconda 
# with password anaconda
$ cd ~
$ wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
$ chmod +x ./Anaconda3-2019.10-Linux-x86_64.sh
$ chown -R anaconda:anaconda /opt/anaconda 
$ chmod -R go-w /opt/anaconda
```

## Some useful scripts

- Rename file by replacing string
  ```bash
  $ find . -name "*.fcs" -exec rename -v 's/pattern/value/' {} \;
  ```
