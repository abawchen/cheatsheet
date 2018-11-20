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

- [libcudart.so.9.1, needed by /usr/local/lib/libopencv_core.so, not found (try using -rpath or -rpath-link)](https://stackoverflow.com/a/40199490/9041712)

    ```bash
    # Check dependency
    $ ldd /usr/local/lib/libopencv_core.so
    ```

- [Purging NVIDIA packages](https://unix.stackexchange.com/questions/440840/how-to-unload-kernel-module-nvidia-drm)

	```bash
	$ sudo apt-get purge nvidia* 
	$ sudo apt-get autoremove
	```

- [Install specified version](https://askubuntu.com/questions/530043/removing-nvidia-cuda-toolkit-and-installing-new-one)

	```bash
	# the version number must be included, or it will still install the previous one.
	$ sudo apt-get install cuda-x.x
	```
