#!/bin/bash

echo "Updating system..."
sudo apt-get update -y

# Install Java
echo "Installing Java..."
sudo apt-get install openjdk-17-jre-headless -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt-get install wget gnupg -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Terraform
echo "Intalling Terraform..."
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_386.zip
sudo apt-get install unzip -y
unzip terraform_1.6.5_linux_386.zip
sudo mv terraform /usr/local/bin/
rm terraform_1.6.5_linux_386.zip

# Verify installations
echo "Installation completed. Versions installed:"
echo "Java version:"
java -version

echo "Jenkins version:"
jenkins --version

echo "Terraform version:"
terraform version