pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'lalithambigai011004/task2'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Lalitha011004/ProjectTask2.git'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Check if dos2unix is installed, if not, install it
                sh '''
                if ! command -v dos2unix &> /dev/null; then
                    echo "🔹 Installing dos2unix..."
                    sudo apt update && sudo apt install -y dos2unix
                fi
                '''

                sh 'dos2unix deploy.sh build.sh Dockerfile docker-compose.yml'
                sh 'chmod +x deploy.sh build.sh'
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh './deploy.sh'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    if (fileExists('docker-compose.yml')) {
                        sh 'docker-compose up -d'
                    } else {
                        error("⚠️ docker-compose.yml not found!")
                    }
                }
            }
        }
    }

    post {
        failure {
            echo "❌ Build failed. Check logs."
        }
        success {
            echo "🚀 Deployment successful!"
        }
    }
}
