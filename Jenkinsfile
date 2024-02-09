pipeline {
    agent any
    
    environment {
        // Define credentials for Git
        BITBUCKET_USERNAME = credentials('GIT_USERNAME')
        BITBUCKET_APP_PASSWORD = credentials('GIT_PASSWORD')
    }

    stages {
        stage('Git Pull with Deployment') {
            steps {
                // Use credentials for SSH key
                withCredentials([usernamePassword(credentialsId: 'chandrasekharmidatha', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) { 
                    // Use SSH agent to authenticate
                    sshagent(['appusererptest']) {
                        // Copy deployment script to the remote server
                        sh "scp -o StrictHostKeyChecking=no /home/chandu/deploy.sh ubuntu@11.0.30.239:/tmp/"
                        
                        // Execute deployment script on the remote server
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@11.0.30.239 sh /tmp/deploy.sh"
                        
                        // Print success message
                        sh "echo Pipeline completed successfully...!"
                    }
                }
            }  
        }       
    }
}
