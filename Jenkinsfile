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
                sh 'cp build/libs/*.war demo.war'
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${COMMIT_HASH}")
                    dockerImage.push("${COMMIT_HASH}")
                    dockerImage.push("latest")
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
