#!/bin/bash
cd /etc
echo 127.0.0.1 $HOSTNAME >> hosts

apt-get update
apt-get remove docker docker-engine docker.io
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
docker run --name hello-world-container hello-world
docker rm hello-world-container
docker rmi hello-world

curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

cd
docker swarm init --advertise-addr $(hostname -I) > swarm_init.out

#The following steps are required onlu on OpenStack VMs
docker network rm ingress
docker network rm docker_gwbridge

docker network create --subnet 172.18.0.0/16 --opt com.docker.network.bridge.enable_icc=false --opt com.docker.network.bridge.enable_ip_masquerade=true --opt com.docker.network.bridge.name=docker_gwbridge --opt com.docker.network.driver.mtu=1400 docker_gwbridge

docker network create --driver overlay --ingress --subnet 10.255.0.0/16 --gateway 10.255.0.1 --opt com.docker.network.driver.mtu=1400 ingress

exit
