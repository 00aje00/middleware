# !/bin/bash

# author: me, bitch
# date: anyone
# purpose: setup docker in a ubunut environment

#==========================> removing all old docker files <======================================

sudo apt-get remove docker docker-engine docker.io
sudo apt-get update

#==========================> installing the docker engine and repositories <======================

sudo apt install docker.io
sudo snap install docker
sudo systemctl start docker
sudo systemctl enable docker

#==========================> testing installed docker engine <====================================

sudo docker run hello-world

if [ $? != 0 ]
 then
  echo "==============> THERE WAS A PROBLEM. Please troubleshoot and try again."
  exit 2
 else
  echo "==============> DOCKER INSTALLED SUCCESSFULLY. One last step"  
  sleep 1
  sudo systemctl status docker
# end

