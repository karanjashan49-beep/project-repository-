pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Manilehra09/lmsportal-jenkins.git'
            }
        }

        stage('Deploy LMS') {
            steps {
                script {
                    sh "chmod +x deploy.sh"
                    sh "./deploy.sh"
                }
            }
        }
    }
    
    post {
        success {
            echo "SUCCESS: Access your portal at http://localhost:8003"
        }
        failure {
            echo "FAILURE: Deployment failed. Checking container logs..."
            sh "sudo podman ps -a | grep lms-webserver || echo 'No container found.'"
        }
    }
}
