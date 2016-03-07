#!/bin/sh

docker stop mesos_local_zk mesos_local_mesos_master mesos_local_mesos_slave mesos_local_marathon
docker stop `docker ps --filter="name=mesos-.*" -q`
docker rm `docker ps -a -q`

echo "Showing containers still running"
docker ps
