pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('lalithambigai011004')
        DOCKER_PASSWORD = credentials('Lali_0121')  
        IMAGE_NAME = "Ecomerrence/lali"
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
