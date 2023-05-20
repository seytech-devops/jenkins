pipeline {
    agent any 

    stages {
        stage("Code Checkout"){
            steps{
                git branch: "kanat", credentialsId: "sshkey", url: "git@github.com:seytech-devops/jenkins.git"
            }
        }
        stage("Change directory"){
            steps{
                sh "cd ${WORKSPACE}"
                sh "pwd"
            }
        }
    }
}