terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.14.0"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "bsmk"
}


resource "aws_security_group" "main" {
  name        = "garden"
  description = "Allow ssh"

  ingress {
    description      = "SSH from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Garden"
  }
}

resource "aws_instance" "garden_linux" {
  # https://github.com/gardenlinux/gardenlinux/releases/tag/576.9
  ami           = "ami-04571dd02adce654b"
  instance_type = "t2.micro"
  key_name      = "garden"

  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "GardenLinux"
  }
}

