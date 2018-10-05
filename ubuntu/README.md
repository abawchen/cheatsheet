- Install Intel wifi driver

  ```bash
  sudo lshw -C network
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


- [NFSv4Howto](https://help.ubuntu.com/community/NFSv4Howto)
  
  ```bash
  sudo apt-get install nfs-common
  ```

- Mount on boot

  ```bash
  sudo vim /etc/fstab
  sudo mount -a
  ```
- Enable network in recovery mode

  - https://askubuntu.com/questions/977450/eth0-error-while-getting-interface-flags-no-such-device
  - https://serverfault.com/questions/21475/starting-network-connection-from-ubuntu-recovery
  - https://askubuntu.com/questions/930871/connect-to-internet-in-recovery-mode

  ```bash
  ifconfig -a
  ```
  
  ```bash
  ifconfig xxxx up
  ```
  
  ```bash
  dhclient xxxx
  ```
  
  ```bash
  ping 8.8.8.8
  ```
  
  ```bash
  echo "namserver 8.8.8.8" | sudo tee /etc/resolv.conf
  ```
  
  ```bash
  ping www.google.com
  ```
