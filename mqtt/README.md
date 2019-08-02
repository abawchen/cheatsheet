## Mosquitto on Ubuntu 18.04

### Quick Start

- Installation
  
  ```bash
  $ sudo apt update
  $ sudo apt install mosquitto mosquitto-clients
  ```

- Quick test
  
  ```bash
  # subscribe in one console
  $ mosquitto_sub -h localhost -t test

  # publish in another console
  $ mosquitto_pub -h localhost -t test -m "hello world"
  ```

### Certificate

- Server Side

  ```bash
  $ sudo vim /etc/mosquitto/conf.d/default.conf
  
  # Plain MQTT protocol
  listener 1883

  # MQTT over TLS/SSL
  listener 8883
  cafile /etc/mosquitto/certs/ca.crt
  certfile /etc/mosquitto/certs/hostname.crt
  keyfile /etc/mosquitto/certs/hostname.key
  ```
  
  ```bash
  # restart mqtt server
  $ sudo systemctl restart mosquitto

  # test
  $ mosquitto_sub --cafile {cafile} -h 127.0.0.1 -p 8883 -t "test" 
  $ mosquitto_pub --cafile {cafile} -h 127.0.0.1 -p 8883 -t "test" -m "hello world"
  ```

- Client Side

  ```bash
  $ sudo vim /etc/mosquitto/conf.d/default.conf
  
  # MQTT over TLS/SSL
  listener 8883
  cafile /etc/mosquitto/certs/ca.crt
  certfile /etc/mosquitto/certs/hostname.crt
  keyfile /etc/mosquitto/certs/hostname.key
  require_certificate true
  # use_identity_as_username true
  ```
  
  ```
  # restart mqtt server
  $ sudo systemctl restart mosquitto
  
  # test
  $ mosquitto_sub --cafile ca.pem -h 127.0.0.1 -p 8883 -t "test" --cert client-1.pem --key client-1-key.pem
  $ mosquitto_pub --cafile ca.pem -h 127.0.0.1 -p 8883 -t "test" -m "hwd" --cert client-1.pem --key client-1-key.pem
  ```
 
### References

- https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-the-mosquitto-mqtt-messaging-broker-on-ubuntu-18-04
- https://primalcortex.wordpress.com/2016/11/08/mqtt-mosquitto-broker-client-authentication-and-client-certificates/
- https://blog.csdn.net/xiaoreqing/article/details/77571881
