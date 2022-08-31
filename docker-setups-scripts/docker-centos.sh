# !/bin/bash

# author: me, bitch
# date: anyone
# purpose: setup docker in a centOS environment

#==========================> removing all old docker files <======================================

sudo yum update -y
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

#==========================> installing the docker repositories <=================================

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#==========================> installing latest docker engine <===================================

sudo yum install -y docker-ce docker-ce-cli containerd.io

#==========================> chekcing docker status <===========================================

sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
echo ""
echo ""
echo "is your docker service active (y/n)"
read answer

if [ $answer = y ]
then 
sleep 1
echo "CONGRATS! your docker is ready for operations"
else
sleep 1
echo "SORRY. troubleshoot and run the script again"
fi

# end

