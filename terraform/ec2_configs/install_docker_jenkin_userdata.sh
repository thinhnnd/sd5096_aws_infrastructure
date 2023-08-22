#!/bin/bash
# Update the system
sudo yum update -y

# Install git
sudo yum install -y git

# Install Docker
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# Install Jenkins
sudo dnf install java-11-amazon-corretto -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo usermod -a -G docker jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

