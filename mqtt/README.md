## Mosquitto on Ubuntu 18.04

- Installation
  ```bash
  $ sudo apt update
  $ sudo apt install mosquitto mosquitto-clients
  ```

- Quick test
  ```bash
  # subscribe in one console
  $ mosquitto_sub -h localhost -t test
  
  ```bash
  # publish in another console
  $ mosquitto_pub -h localhost -t test -m "hello world"
  ```
  
- More config

  ```bash
  $ sudo vim /etc/mosquitto/conf.d/default.conf
  ```
  
  ```
  # Plain MQTT protocol
  listener 1883

  # End of plain MQTT configuration

  # MQTT over TLS/SSL
  listener 8883
  cafile /etc/mosquitto/certs/ca.crt
  certfile /etc/mosquitto/certs/hostname.crt
  keyfile /etc/mosquitto/certs/hostname.key
  ```
  
  ```
  # restart mqtt server
  $ sudo systemctl restart mosquitto
  ```
