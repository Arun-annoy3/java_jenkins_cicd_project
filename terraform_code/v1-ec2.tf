terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "5.70.0"
    }
  }
}

provider "aws" {

    region = "us-east-1"

  
}

resource "aws_instance" "demo-server" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t3.medium"
  key_name = "devops"
  security_groups = ["devops"]
}

resource "aws_security_group" "devops" {
  name        = "devops"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}