# prerequisite
  - boot2docker: https://docs.docker.com/installation/mac/
  - docker-compose: https://docs.docker.com/compose/install/
  - redis-cli: http://redis.io/download/
  - git clone https://git.autodesk.com/cloudplatform-compute/cse and switch to develop branch

# steps
  - start boot2docker and get the VM IP using "boot2docker ip"
  - download the docker-compose.yml, logger.xml and Dockerfile from: https://git.autodesk.com/gaoh/dry-dock/tree/master/cse/local
  - put the files into cse/stack directory
  - open cse/stack/conf/application.conf and change all the broker ip to the ip you got from step 1
  - open docker-compose.yml file and change ADVERTISED_HOST to the ip you got from step 1
  - under cse/stack, run "./activator stage" to build cse play! application
  - under cse/stack, run "docker-compose up"
  - stop the whole app by running "docker-compose stop", kill using "docker compose kill"

# develop against the local setup
  - start the whole setup using "docker-compose up", and you will have a clean cse environment.
    please note at this point, you are still not able to use cse yet. you will have to register a channel.
  - in order to use cse, you need to create a record in redis. you can do that by:
    - use "redis-cli -h [boot2docker ip]" to connect to cse redis server.
    - type: hset cse:acl anonymous '{"channels":{"test-channel":"rw"}}', if you see "1" in the output, then it's a success.
      this command will register "anonymous" user, and allow this user to read and write to "test-channel"
  - now you can use cse at: [boot2docker ip]:9000 . your user key is anonymous, and your channel is test-channel.
    for example, if you want to test out cse-java-example, and your boot2docker ip is 192.168.33.105 you can use:
    "sbt runMain example.LowLevel 192.168.33.105:9000 test-channel anonymous" to test it out.
