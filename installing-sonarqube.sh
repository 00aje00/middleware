# !/bin/bash

# authers : overachievers
# date : today 
# purpose : installing sonarQube

#=======================> making sure user isn't root <====================
 if [ $UID -eq 0 ]
then
echo "you must be a regular user to run sonarqube"
echo " thank you. try again"
exit 1
fi
#=======================> setting up java <=================================

sudo yum update -y
sudo yum install java-11-openjdk-devel -y 
sudo yum install java-11-openjdk -y

if [ $? -ne 0 ]
then 
echo "sorry. java failed to install"
echo "troubleshoot and try again"
exit 1
fi 

sudo yum install wget -y

#=======================> instsalling sonarqube <============================

sudo yum install unzip
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip -P /opt
sudo unzip /opt/sonarqube-9.3.0.51899.zip -d /opt

#=======================> Adjusting user permisions <========================

sudo chown -R $USER:$USER /opt/sonarqube-9.3.0.51899
sudo sed -i 's/#RUN_AS_USER=/RUN_AS_USER=$USER/g' /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh
sudo chmod +x /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh
sudo /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh start
sudo /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh status


#=======================> adjusting firewall setting <=======================
# incase the firewall is blocking port 9000, open it with this

# sudo systemctl start firewalld
# sudo firewall-cmd --permanent --add-port=9000/tcp
# sudo firewall-cmd --reload

#=======================> Some basic info <==================================

ip a | grep 192
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "here's your ip. paste that in your browser using the syntax <ip:port>"
echo "port is 9000"
sleep 5
echo "Remember to use 'admin' for user and password"
# end
