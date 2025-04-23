pipeline {
    agent any

    environment {
        dockerImageName = 'systemtesting48/html'
        registryCredential = 'Docker'
        dockerImage = ''
    }

    stages {
        stage('Cloning Git') {
            steps {
                git(
                    url: 'https://github.com/System-Sudo/others.git',
                    branch: 'main',
                    credentialsId: 'github'
                )
            }
        }

        stage('Build Image') {
            steps {
                script {
                    dockerImage = docker.build(dockerImageName)
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Run Image') {
            steps {
                script {
                    // Run the Docker container in detached mode
                    def container = docker.image(dockerImageName).run('-d -p 80:80')

                    // Wait for the container to be ready
                    sh 'sleep 10'

                    // Optionally, execute commands inside the running container
                    sh "docker exec ${container.id} curl http://localhost:3000"

                    // Stop the container after use
                    sh "docker stop ${container.id}"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
