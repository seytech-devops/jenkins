pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                sh "echo 'terraform init'"
            }
        }
        stage('Terraform Plan'){
            steps {
                sh "echo 'terraform plan'"
            }
        }
        stage('Terraform Apply'){
            steps {
                sh "echo 'terraform apply'"
            }
        }
    }
}