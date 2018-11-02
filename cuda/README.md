## Ubuntu

- Check VGA

	```
	$ sudo update-pciids
	$ sudo lspci | grep VGA
	```
	
	```bash
	02:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 1070 Ti] (rev a1)
	08:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30)
	```

- [Install Nvidia GPU driver](https://goo.gl/Ji5FQB)

	```bash
	$ sudo add-apt-repository ppa:graphics-drivers/ppa
	$ sudo apt install nvidia-384
	```

- Install Nvidia-docker

	```bash
	$ curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu16.04/amd64/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
	$ sudo apt-get update
	$ sudo apt install nvidia-modprobe nvidia-docker
	```
