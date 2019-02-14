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

- [Install Docker-Compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04)

  ```bash
  # Notes: Change the docker-compose version accordingly
  $ sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  $ sudo chmod +x /usr/local/bin/docker-compose
  $ docker-compose --version
  ```
