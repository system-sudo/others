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
                    
                    def container = docker.image(dockerImageName).run('-d -p 80:80')

                
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
