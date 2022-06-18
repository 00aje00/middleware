# !/bin/bash

# author : overachievers
# date : today

#==========> jenkins server setup <============

sudo yum install java-1.8.0-openjdk-devel -y

if [ $? -ne 0 ]
then 
exit 1
echo "=======> SORRY. java failed installation"
else
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
fi

#==========> Now installing jenkins <============

sudo yum install jenkins

if [ $? -ne 0 ]
then 
exit 1
echo "=======> SORRY. jenkins failed installation"
else
sudo systemctl start jenkins
sudo systemctl status jenkins
sleep 5
sudo systemctl enable jenkins

#=========> adjusting the firelwall <==============

sudo systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload

#=========> pulling needed output <================

echo "==========> NOW PULLING IP and PORT"
sleep 3
echo "==========> port is 8080 btw"
sleep 3
ifconfig | grep 192
echo "Remember to paste in the syntax <ip:port>, into browser"

#==========> jenkins admin password <================

sleep 10
echo "assuming you're jenkins server is up and running, here's your admin password"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo " ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ "

# end
