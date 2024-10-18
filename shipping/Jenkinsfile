pipeline {
    agent {
        node {
            label 'AGENT'
        }
    }
    tools {
        maven 'maven3'
    }
    triggers {
        // Trigger the pipeline when there's a GitHub push event
        githubPush()
    }
    stages {
        stage('Checkout Code') {
            steps {
            git branch: 'main',credentialsId: 'git-cred', url: 'https://github.com/Anil-Nadikuda/Blue-Green-Deployment.git'
                }
            }
            
            stage ('Build') {
                steps {
                    sh 'mvn clean package'
                }
            }

            stage('Test') {
                steps {
                    sh 'mvn test'
                }
            }

            stage('SonarQube Analysis') {
                steps {
                    sh """
                        sonar-scanner
                        """
                }
            }
        }


    post {
        always {
            echo 'Cleaning up...'
            // Add cleanup steps that run regardless of pipeline success or failure
        }
    }
}