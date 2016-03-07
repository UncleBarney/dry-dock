# Mesos local setup with docker

A simple but flexible mesos setup running inside docker container.
This setup include:
* A Zookeeper node
  * Port mapping: 2181:2181 2888:2888 3888:3888
* A Mesos Master node
  * Port mapping: 5050:5050
* A Mesos Slave node
  * Port mapping: 5051:5051 30001-30021:1-21 30023-35050:23-5050 35052-62000:5052-32000
  * CPU: 24
  * Memory: 2G
* A Marathon UI node, with port 80 open

## How to Use
* Make sure your docker daemon is running
* Export the environment variable: MESOS_LOCALSETUP_HOST_IP to your docker daemon ip, for example:
  * if you have boot2docker installed, you can do: ```
  export MESOS_LOCALSETUP_HOST_IP=`boot2docker ip`
  ```
  * if you have docker-machine installed,  you can do: ```
  export MESOS_LOCALSETUP_HOST_IP=`docker-machine ip mesos_local`
  ```
* Run ```sh start.sh``` to spin up Mesos local setup
* Run ```sh stop.sh``` to stop up Mesos local setup and all Marathon started containers

## How to add Ochothon
* Add the following env variables to dcos.json definition:
 * "MARATHON_MASTER": "MESOS_LOCALSETUP_HOST_IP:5051",
 *  "ochopod_zk" : "zk://MESOS_LOCAL_SETUP_HOST_IP:2181"
* You must replace MESOS_LOCALSETUP_HOST_IP with the actual value
