pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-username')  // Store in Jenkins Credentials
        DOCKER_PASSWORD = credentials('docker-password')
        IMAGE_NAME = "ar8888/react-capstone"
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Grant executable permission to deploy script
                    sh 'chmod +x deploy.sh'

                    // Execute deploy script
                    sh './deploy.sh'
                }
            }
        }
    }
}
