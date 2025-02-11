pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nmap-python:latest'  // Define the Docker image name
        TARGET_HOST = 'cmet.gov.in'          // Define the target for the Nmap scan
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container and pass the target as an environment variable
                    sh """
                        docker run --rm -e TARGET_HOST=$TARGET_HOST $DOCKER_IMAGE
                    """
                }
            }
        }
    }

   post {
    always {
        emailext(
            subject: "Pipeline Status: ${BUILD_NUMBER}",
            body: '''<html>
                        <body>
                            <p>Build Status: ${BUILD_STATUS}</p>
                            <p>Build Number: ${BUILD_NUMBER}</p>
                            <p>Check the <a href="${BUILD_URL}">console output</a>.</p>
                        </body>
                    </html>''',
            to: 'techguynishant@gmail.com',
            from: 'jenkins@example.com',  // This will show as the sender
            replyTo: 'jenkins@example.com',  // Reply-to address
            mimeType: 'text/html'
        )
    }
}

}
