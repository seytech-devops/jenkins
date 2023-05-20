# Class Notes - 050823

# Introduction to Jenkins 

- ### [Install Jenkins on EC2](https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/)
- ### [Install Jenkins via Terarform](https://github.com/seytech-devops/jenkins/tree/main/terraform)


## What is Jenkins
- is open source automation server. 
- Most used tool in the indutry. It has been on the market for while. One of the oldest automation server. 
- is java based application. (requires java to run)
- very custimazible 
- have many different plugins that make it even more custimizable 
- it uses java as a DLS (Domain Specific Languange)

## Jenkins Terminalogy/ Architecture 
    - What is cluster?
        - pool of servers 
        
    - node/ec2/vm --> they all refer to the same thing

    - two node cluster: The cluster made of two servers

    - Main/Master Node in a Cluster 
        - manages the client/slave nodes. 


## Install Jenkins on EC2
- By default Jenkins run on port 8080 
- jenkins home directory /var/lib/jenkins


## Follow instructions
- Need to ssh to a EC2 instance
- Copy the value from `/var/lib/jenkins/secrets/initialAdminPassword`
- Create the admin user 


## Install plug-ins
- Go to 
    --> Manage Jenkins
        --> Manage Plugins (Suggested one)
        --> Rebuilder 
        --> Blue Ocean
        --> Role-Based Authorization Strategy
            --> Configure Global Security --> Authorization --> Matrix-based security 
                --> Autheticated Users (Select the appropriate check boxes)

                NOTE:
                    --> ssh to box
                    --> switch to jenkins user (check the shell if `/bin/false` change to `/bin/bash`)
                    --> sudo su jenkins
                USE:
                    --> ssh-keygen 
                        --> copy public key into github 
                        --> copy private key into Jenkins Credentials
                        --> check if git isntalled (if not install using yum)

## Configure credentials
    --> Manage Jenkins
        --> Credentials 
            --> System
                --> Global credentials (Unrestricted)
                    --> Add Credentials
                        --> SSH Username with private key  (Need to generate ssh-key)



## Create first-pipeline 
    --> New Item
        --> Follow steps
            --> Pipeline
                --> `Pipeline script` to `Pipeline script from SCM`
                    --> Git
                        --> Repository URL (Paste the url)
                        --> Credentials (Should show the name stored earlier)
                        --> Branch Specifier (*/main)
                        --> Script Path (Jenkinsfile-kanat)

## [Pipeline Syntax Helper](http://url:8080/job/first-pipeline/pipeline-syntax/)


## [Jenkinsfile parameters](https://www.jenkins.io/doc/book/pipeline/syntax/#parameters)


# Jenkinsfile
    - Environments
        - userdefined
        - builtin
    - Options   
        - 
    - Parameters
        - userdefined
            - choices
            - string
            - boolean
    - triggers
    - Jenkins cron
    - stage
        
    - tools
    - input 
    - when 