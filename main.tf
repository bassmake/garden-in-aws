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

resource "aws_instance" "garden_linux" {
  # https://github.com/gardenlinux/gardenlinux/releases/tag/576.9
  ami           = "ami-04571dd02adce654b"
  instance_type = "t2.micro"

  tags = {
    Name = "GardenLinux"
  }
}

