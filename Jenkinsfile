pipeline {
    agent any 

    stages {
        stage('Code Checkout'){
            steps{
                git branch: 'main', credentialsId: 'sshkey', url: 'git@github.com:seytech-devops/jenkins.git'
            }
        }
        stage('Change directory'){
            steps{
                sh 'cd ./jenkins'
                sh 'pwd'
            }
        }
    }
}