pipeline {
    environment {
        imagename = "mthibault256/flask_docker_ver_2:latest"
        theDockerFile = "Dockerfile"
        dockerRegistryCredential = "jenkins-docker-credential"
    }
    
    agent any
    
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Cloning Git') {
            steps {
                git([
                    url: "git@github.com:MattT253/jenkins_test.git",
                    branch: "main",
                    credentialsId: "jenkins-github-credential"])
            }
        }
    
        stage("Building image") {
            steps {
                script {
                    testDockerImage = docker.build("${env.imagename}", "-f ${env.theDockerFile} .")
                }
            }
        }
        
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('', dockerRegistryCredential) {
                        testDockerImage.push("latest")
                    }
                    docker.withRegistry('', dockerRegistryCredential) {
                        testDockerImage.push("latest")
                    }
                }
            }
        }
    
        stage ("Remove unused docker image") {
            steps {
                sh "docker rmi $imagename"
            }
        }
        
    }
}