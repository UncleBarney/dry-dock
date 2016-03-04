
docker run --name mesos_local_zk -d \
  -p 2181:2181 \
  -p 2888:2888 \
  -p 3888:3888 \
  quay.io/autodeskcloud/zookeeper

docker run --name mesos_local_mesos_master -d \
  --net="host" \
  -p 5050:5050 \
  -e "MESOS_HOSTNAME=${HOST_IP}" \
  -e "MESOS_IP=${HOST_IP}" \
  -e "MESOS_ZK=zk://${HOST_IP}:2181/mesos" \
  -e "MESOS_PORT=5050" \
  -e "MESOS_LOG_DIR=/var/log/mesos" \
  -e "MESOS_QUORUM=1" \
  -e "MESOS_REGISTRY=in_memory" \
  -e "MESOS_WORK_DIR=/var/lib/mesos" \
  quay.io/autodeskcloud/mesos-master

docker run --name mesos_local_mesos_slave -d \
  --net="host" \
  -p 5051:5051 \
  -e "MESOS_MASTER=zk://${HOST_IP}:2181/mesos" \
  -e "MESOS_IP=${HOST_IP}" \
  -e "MESOS_LOG_DIR=/var/log/mesos" \
  -e "MESOS_LOGGING_LEVEL=INFO" \
  -e "MESOS_PORT=5051" \
  -e "MESOS_CONTAINERIZERS=docker" \
  -e "MESOS_DOCKER_SOCK=/var/run/docker.sock" \
  -v /sys:/sys \
  -v /prod:/prod \
  -v /var/run/docker.sock:/var/run/docker.sock \
  quay.io/autodeskcloud/mesos-slave

docker run --name mesos_local_marathon -d \
 -p 8080:8080 \
 quay.io/autodeskcloud/marathon \
 --master zk://${HOST_IP}:2181/mesos --zk zk://${HOST_IP}:2181/marathon
