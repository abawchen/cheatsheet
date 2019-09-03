## Operations

  ```bash
  # run without sudo
  $ sudo groupadd docker
  $ sudo gpasswd -a $USER docker
  # re-login
  $ docker run hello-world
  
  # docker run
  $ docker run -it \
      -p hostPort:containerPort \
      -v hostPath:containerPath \
      --name containerName \
      imageName \
      cmd
  
  # ssh into container
  $ docker exec -it container_name_or_id bash

  # check container ip
  $ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' containerName|containerID`

  # stop all containers
  $ docker stop $(docker ps -a -q)
    
  # remove all containers
  $ docker rm $(docker ps -a -q)
  ```

## Unbuntu

- [Install Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)

  ```bash
  $ sudo apt-get update
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
  ```
- [Install Docker-Compose](https://tinyurl.com/y4ll2x8d)

  ```bash
  $ sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  $ sudo chmod +x /usr/local/bin/docker-compose
  $ docker-compose --version
  # docker-compose version 1.23.1, build b02f1306
  ```
  
- [Install Nvidia-Docker](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))

  ```bash
  $ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
    sudo apt-key add -
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
  $ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-docker.list
  $ sudo apt-get update
  $ sudo apt-get install nvidia-docker2
  $ sudo pkill -SIGHUP dockerd
  ```


- [Install Docker-Compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04)

  ```bash
  # Notes: Change the docker-compose version accordingly
  $ sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  $ sudo chmod +x /usr/local/bin/docker-compose
  $ docker-compose --version
  ```
