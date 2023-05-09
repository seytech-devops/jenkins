# EC2 Instance
resource "aws_instance" "jenkins_ec2" {
  ami           = data.aws_ami.amazon_ami.id
  instance_type = var.instance_type
  key_name      = "tbadmin"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "Jenkins"
    TF   = true
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update
    wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    yum upgrade
    dnf install java-11-amazon-corretto -y
    yum install jenkins -y 
    systemctl enable jenkins
    systemctl start jenkins
  EOF
}

# Security Group 
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow ssh and http traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.150.242.132/32", "24.12.163.121/32"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}