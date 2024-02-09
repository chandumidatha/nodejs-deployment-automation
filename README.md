# Nodejs Application Deployment

This repository contains a Jenkins pipeline script and a deployment script for automating the deployment of an ERP solution.

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


