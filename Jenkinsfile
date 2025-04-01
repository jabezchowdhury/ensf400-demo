pipeline {
    agent any

    environment {
        IMAGE_NAME = "jabezchowdhury/ensf400-demo"
        COMMIT_HASH = "${env.GIT_COMMIT.take(7)}"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/jabezchowdhury/ensf400-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh './gradlew build'
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${COMMIT_HASH}")
                }
            }
        }


        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    script {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy (Optional)') {
            steps {
                echo 'Deployment steps go here (if needed)'
            }
        }
    }

    post {
        always {
            echo 'Jenkins pipeline completed'
        }
    }
}
