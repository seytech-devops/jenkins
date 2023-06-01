pipeline {
    agent any
    
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '7', numToKeepStr: '5')
    }

    stages {
        stage('SCM Checkout'){
            steps{
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[credentialsId: 'sshkey', url: 'git@github.com:seytech-devops/terraform-ansible-aws.git']])
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