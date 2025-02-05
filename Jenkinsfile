pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-username')
        DOCKER_PASSWORD = credentials('docker-password')  // Ensure 'docker-password' is correct
        IMAGE_NAME = "ar8888/react-capstone"
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build, tag, and push Docker image
                    sh './deploy.sh'
                }
            }
        }
    }
}
