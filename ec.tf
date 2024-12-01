provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "1.9.8"
  required_providers {
    aws = {
      version = "5.78.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "sachiabh2024-30"
    region         = "us-east-1"
    key            = "assignment4/terraform.tfstate"
    dynamodb_table = "GameScore"
    encrypt        = true
  }
}

resource "aws_instance" "instance-nv" {
  for_each      = var.dynamic
  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = "My_firstkey"

  tags = {
    Name = each.value.name
  }
}