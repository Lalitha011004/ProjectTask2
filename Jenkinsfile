pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Lalitha011004/ProjectTask2.git'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
