# Nodejs Application Deployment
This repository contains a Jenkins pipeline script and a deployment script for automating the deployment of an ERP solution.

## Instructions for Setting Up Java and Jenkins on Ubuntu.
Java Installation,Java is a prerequisite software for running Jenkins. Follow the steps below to install Java:

Update the package index:
```bash
sudo apt update
```
Install OpenJDK 17 (Java Runtime Environment):
```bash
sudo apt install openjdk-17-jre
```
Verify Java installation:
```bash
java -version
```
Jenkins Installation:
Follow these steps to install Jenkins:
Import Jenkins repository key:

```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
```
Add Jenkins repository to your system:
```bash
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
```
Update the package index:
```bash
sudo apt-get update
```
Install Jenkins (version 2.346.2):
```bash
sudo apt-get install jenkins=2.346.2 -y
```
```bash
#Enable Jenkins service to start on boot
sudo systemctl enable jenkins
sudo systemctl start jenkins
#To check the status of the Jenkins service
sudo systemctl status jenkins
```

Make sure to replace the version number 2.346.2 with the desired version of Jenkins if needed.

## Jenkins Pipeline Script

The Jenkins pipeline script (`Jenkinsfile`) automates the following steps:
- Pulls the latest changes from a Git repository.
- Deploys the changes to a remote server using SSH.

To use the Jenkins pipeline script:
1. Ensure you have Jenkins installed and configured.
2. Create a new pipeline job in Jenkins.
3. Copy the content of `Jenkinsfile` in the pipeline script section.
4. Set up appropriate credentials in Jenkins for Git and SSH access.

## Deployment Script

The deployment script (`deploy.sh`) automates the following steps:
- Checks out a specific branch from a Git repository.
- Performs a `git pull` to fetch the latest changes.
- Starts or reloads the application using PM2.

To use the deployment script:
1. Ensure you have Node.js, PM2, and Git installed on your deployment server.
2. Customize the script according to your project's requirements.
3. Set appropriate permissions for the script (`chmod +x deploy.sh`).
4. Run the script (`./deploy.sh`) on your deployment server.

## Requirements
- Jenkins
- Git
- SSH
- Node.js
- PM2


