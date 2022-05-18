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
