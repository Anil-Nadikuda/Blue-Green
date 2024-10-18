----------------------------------------------
docker run -d -p 8080:8080 --name jenkins jenkins/jenkins:lts
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
docker stop jenkins
docker start jenkins
docker rm -f jenkins
##Docker jenkins image password search
sudo docker exec ${CONTAINER_ID or CONTAINER_NAME} cat /var/jenkins_home/secrets/initialAdminPassword 

--------------------------------------------
-------using curl------------------
sudo curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo

##sudo curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
---------------------------------------------

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk
sudo yum install jenkins

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

###Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


sudo docker run -d --name sonarqube -p 9000:9000 sonarqube:latest


##########################################
-----------NEXUS-sonatype-------------------
#############################################
 sudo yum install docker
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER
newgrp docker
## verify 
# sudo systemctl start docker
# sudo systemctl enable docker

docker run hello-world


docker pull sonatype/nexus3

docker run -d -p 8081:8081 --name nexus sonatype/nexus3

docker logs nexus
docker exec -it nexus cat /nexus-data/admin.password
docker update --restart unless-stopped nexus


#password
cat /nexus-data/admin.password

 ##########################################
 ----------SonarQube------------------
 ###########################################

docker run -d --name sonarqube -p 9000:9000 sonarqube


#############################################
------Docker dowload and install---------------
###########################################

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

sudo systemctl status docker

sudo usermod -aG docker $USER

sudo docker run -d --name sonarqube \
  -p 9000:9000 \
  sonarqube
